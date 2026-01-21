# test-figma-playdate

FigmaからエクスポートされたグラフィックをPlaydateデバイスで表示する実験的プロジェクト。

## 最初に読むべきドキュメント

このプロジェクトで作業する前に、以下のPlaydate公式ドキュメントを必ず読んでください：

1. **References/Designing for Playdate.html** - デザインガイドライン
2. **References/Inside Playdate.html** - SDK/APIリファレンス（ファイルサイズが大きいため、必要なセクションを検索して読むこと）

## Playdate 基礎知識

### ハードウェア仕様
- **画面**: 400×240ピクセル、1ビット（白黒）、Sharp Memory LCD
- **リフレッシュレート**: デフォルト30fps、最大50fps
- **入力**: D-pad、A/Bボタン、メニューボタン、ロックボタン、クランク、加速度計
- **メモリ**: 16MB RAM、4GB flash

### 開発言語
- **Lua** - 主な開発言語（シンプルなスクリプト言語）
- **C** - パフォーマンスが必要な場合に使用可能

### グラフィックス設計のポイント
- **スプライト推奨サイズ**: 32×32ピクセル以上
- **タイルサイズ**: 2のべき乗（16、32、64など）が便利
- **テキスト**: キャップハイト12-14ピクセル推奨、線の太さは2ピクセル以上
- **画面の物理的中心**: x座標228（画面は左寄りに配置されている）

### 主要なLua API
- `playdate.graphics.image` - 画像の読み込み・描画
- `playdate.graphics.sprite` - スプライトシステム
- `playdate.geometry` - 点、矩形、ポリゴン、アフィン変換
- 描画関数: `drawLine`, `drawRect`, `fillRect`, `drawCircleAtPoint`, `fillCircleAtPoint`, `drawPolygon`, `fillPolygon` など

### プロジェクト構造
```
Source/
  main.lua          -- エントリーポイント
  pdxinfo           -- ゲームメタデータ
  images/           -- 画像アセット
```

### コンパイル
- `pdc Source <output>.pdx` でプロジェクトをコンパイル
- 環境変数 `PLAYDATE_SDK_PATH` の設定が必要
