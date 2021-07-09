![ヘッダー画像](/assets/images/Logo.png)
# 手洗い促進アプリ 御手洗PLUS
京都大学情報学研究科社会情報学専攻の実習クラスで作成したシステムです。

御手洗PLUSは手洗いの促進を目標としており、スマホアプリ（iOS, Androidに対応）とHandwash Evaluator(Jetson Nano)と使用したシステムです。
ユーザがHandwash Evaluatorが設置されている自宅、研究室や職場へ到着すると、アプリからプッシュ通知が届きます。Handwash Evaluatorはユーザの手洗い開始を検知し、ユーザの手洗いを評価します。手洗い評価はHandwash Evaluatorに繋がれたモニターに映し出されているアニメーションと連動し可視化されます。
手洗いの終了を検知するとモニターにQRが映し出され、ユーザはアプリでQRをスキャンすることでスコアを記録します。

Handwash Evaluatorのリポジトリのリンクは[こちら](https://github.com/is0392hr/handwash)

当該授業で**最優秀賞**を受賞しました🎉🎉🎉

**紹介動画は[こちら](https://www.youtube.com/watch?v=PBns3sUhe7Y)**

**スライドは[こちら]()**

## 開発体制
<table>
  <tr>
    <th>開発人数</th>
    <td>
      5人<br>
      <b><a href="https://github.com/is0392hr"><img src="https://github.com/is0392hr.png" width="50px;" /></b>
      <b><a href="https://github.com/chum0n"><img src="https://github.com/chum0n.png" width="50px;" /></b>
      <b><img src="/assets/images/human.png" width="50px;" /></b>
      <b><img src="/assets/images/human.png" width="50px;" /></b>
      <b><img src="/assets/images/human.png" width="50px;" /></b>
    </td>
  </tr>
  <tr>
    <th>担当</th>
    <td>
      <a href="https://github.com/is0392hr">@is0392hr</a>：Planner of this project, Developer of Handwash Evaluator, Main developer of QR scanner and more<br>
      <a href="https://github.com/chum0n">@chum0n</a> : Developer of Notification App, Main developer of database-related functions<br>
      <a href="https://github.com/tahaShaheen">@tahaShaheen</a> : Developer of animation used in Handwash Evaluator, Co-developer of functions related to geolocation information acquisition<br>
      Abe : Developer of Notification App, Main developer of functions related to geolocation information acquisition<br>
      Suzuki : UI designer of Notification App<br>
    </td>
  </tr>
  <tr>
    <th>開発期間</th>
    <td>1ヶ月</td>
  </tr>
  <tr>
    <th>使用技術</th>
    <td>Flutter(Dart)</td>
  </tr>
</table>
