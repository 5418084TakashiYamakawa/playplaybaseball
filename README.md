# playplaybaseball
デジタルコンテンツにおけるゲーム制作用のレポジトリー

## 7/3
- 山川
  - レポジトリー作成
  - カメラのテスト、MDクラス、Outクラスを追加
  - 簡易的なタイトルとリザルト画面を追加
  - Outクラスを修正。別にAreaクラスを作り、OutとHomerunクラスに継承している
  - Hitboxクラスを作成。Areaクラスを継承し、打たれた時の角度を返すangleメソッドが入っている
- 杉浦
  - メインのゲーム自体のプログラムyakyu,gamestateクラスを追加。
  - Areaクラスをyakyuに移しyakyu内でテスト

## 7/10
- 山川
  - Camera_Imputクラスを作成。MDの配列をとりカメラの判定がmainのプログラムで書いてあったものをほぼ全てクラスにまとめてある。<-一部本文の方に書かないとなぜか反応しないものがあるためその部分だけ注意
  - yakyuのフォルダにその他のクラスを移動させ動くかテスト->Areaクラスのlinecrossedがうまく動いてなさそう。カメラは多分読み込めている。
- 杉浦
  - Hitboxを読み込んで、球を打った時角度がつくようにyakyuのプログラムを変更。
  - 暫定で球を５球打ったらリザルト画面に移動するように変更。

## 7/17
- 山川
  - gamestate内の打った時の角度のプログラムを修正。
  - yakyu内にcamera等のクラスを追加しcamera_Imputの入力で球が打てる様に変更。
  - 暫定的に画面外に球が出るとアウトになり投球からやり直す様に変更。
  - camera_Imputをyakyuのプログラムに合う様に修正。
- 杉浦
  - ending後リスタートするとすぐにendingになってしまうバグを修正。
  - outクラスを使ってアウトの判定をyakyuに追加。
- 共同
  - それぞれのプログラムを合わせて細かいところが合う様に調整・修正。
  - とりあえず、カメラを読み込みボールを打ててゲームが終了するところまでの簡単なプロトタイプが完成。
