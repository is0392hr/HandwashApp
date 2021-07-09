import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../score_reading/score_reading_widget.dart';
import '../db/db_provider.dart';


@immutable
class ConfirmViewArguments {
  const ConfirmViewArguments({this.data});
  final String data;
}

class QRCodeScannerView extends StatefulWidget {
  @override
  _QRCodeScannerViewState createState() => _QRCodeScannerViewState();
}

class _QRCodeScannerViewState extends State<QRCodeScannerView> {
  QRViewController _qrController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  bool _isQRScanned = false;

  // ホットリロードを機能させるには、プラットフォームがAndroidの場合はカメラを一時停止するか、
  // プラットフォームがiOSの場合はカメラを再開する必要がある
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrController?.pauseCamera();
    }
    _qrController?.resumeCamera();
  }

  @override
  void dispose() {
    _qrController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _checkPermissionState();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan the QR code'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: _buildQRView(context),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await _qrController?.toggleFlash();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: _qrController?.getFlashStatus(),
                            builder: (context, snapshot) =>
                                Text('Flash: ${snapshot.data}'),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await _qrController?.flipCamera();
                            setState(() {});
                          },
                          child: FutureBuilder(
                            future: _qrController?.getCameraInfo(),
                            builder: (context, snapshot) => snapshot.data !=
                                null
                                ? Text(
                                'Camera facing ${describeEnum(snapshot.data)}')
                                : const Text('loading'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await _qrController?.pauseCamera();
                          },
                          child: const Text(
                            'pause',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await _qrController?.resumeCamera();
                          },
                          child: const Text(
                            'resume',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQRView(BuildContext context) {
    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.green,
        borderRadius: 16,
        borderLength: 24,
        borderWidth: 8,
      ),
    );
  }


  void _onQRViewCreated(QRViewController qrController) {
    setState(() {
      _qrController = qrController;
    });

    // データを保存する
    // QRを読み込みをlistenする
    qrController.scannedDataStream.listen((scanData) {
      // 次の画面へ遷移
      _transitionToNextScreen(scanData.code);
    });
  }

  Future<void> _transitionToNextScreen(String data) async {
    // database_helper.dartのDataBaseHelperをインスタンス化
    final dbProvider = DBProvider.instance;

    void _insert(String score) async {
      DateTime now = DateTime.now();

      Map<String, dynamic> row = {
        DBProvider.columnScore : score,
        DBProvider.columnCreatedAt  : now.toString()
      };
      await dbProvider.insert(row);
    }
    void _query() async {
      final allRows = await dbProvider.queryAllRows();
      allRows.forEach((row) => print(row));
    }
    if (!_isQRScanned) {
      // カメラを一時停止
      _qrController?.pauseCamera();
      _isQRScanned = true;
      // save to database
      _insert(data);
      _query();
      // 次の画面へ遷移
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreReadingWidget(ConfirmViewArguments(data: data))
        )
      ).then(
        // 遷移先画面から戻った場合カメラを再開
            (value) {
          _qrController?.resumeCamera();
          _isQRScanned = false;
        },
      );
    }
  }
}
