# Wave Player Mobile

[English](README.md) · [한국어](README.ko.md) · **日本語** · [简体中文](README.zh-CN.md) · [Español](README.es.md)

Spotify デスクトップアプリで **Spotify モバイル版の画面** をそのまま使えるミニプレーヤーです。
[Wave Player](https://github.com/03x1/Wave-Player)（Spicetify 拡張機能）をもとに作りました。

<p align="center">
  <img src="docs/phone-canvas.gif" width="300" alt="Canvas 動画の上で単語ごとに色が付いていく歌詞">
</p>

## 画面

### モバイル表示

ミニプレーヤーを開くと最初に表示される画面です。Canvas 動画またはアルバムカバーの上に現在の歌詞が 1 行表示され、その下にコントロールと歌詞プレビューカードがあります。

<table>
  <tr>
    <td align="center"><img src="docs/phone-lyrics-open.jpg" width="240" alt="歌詞プレビューを開いたモバイル表示"></td>
    <td align="center"><img src="docs/phone-lyrics-folded.jpg" width="240" alt="歌詞プレビューを閉じたモバイル表示"></td>
    <td align="center"><img src="docs/phone-cover.jpg" width="240" alt="アルバムカバーに切り替えたモバイル表示"></td>
  </tr>
  <tr>
    <td align="center">歌詞プレビューを開く</td>
    <td align="center">歌詞プレビューを閉じる</td>
    <td align="center">アルバムカバーに切り替え</td>
  </tr>
</table>

- アルバムアートをクリックするたびに **Canvas 動画 ↔ カバー** が切り替わります。カバーのときは Apple Music のように、カバーの色がゆっくり動く背景になります。
- 歌詞プレビューカードは ⌄ / ⌃ で開閉できます。

### 全画面歌詞

<table>
  <tr>
    <td align="center"><img src="docs/lyrics-canvas.jpg" width="240" alt="Canvas 背景の全画面歌詞"></td>
    <td align="center"><img src="docs/lyrics-cover.jpg" width="240" alt="ぼかしたカバー背景の全画面歌詞"></td>
  </tr>
  <tr>
    <td align="center">Canvas がある曲</td>
    <td align="center">Canvas がない曲（ぼかしたカバー）</td>
  </tr>
</table>

- Canvas がある曲は Canvas を、ない曲は Apple Music のようにぼかしたカバーを背景にします。単色の背景も選べます。
- 歌っている単語が少し大きくなりながら色が付き、前奏や間奏では `• • •` が表示されます。
- 日本語の歌詞には漢字の上に **ふりがな** が付きます。

### 再生キュー · メニュー

<table>
  <tr>
    <td align="center"><img src="docs/queue.jpg" width="240" alt="再生キュー"></td>
    <td align="center"><img src="docs/menu.jpg" width="240" alt="その他メニュー"></td>
  </tr>
  <tr>
    <td align="center">再生キュー（ドラッグで並べ替え、シャッフル・リピート・タイマー）</td>
    <td align="center">⋯ メニュー（アルバム・アーティストへ移動、スリープタイマー、歌詞のソース、設定）</td>
  </tr>
</table>

### 設定

<table>
  <tr>
    <td align="center"><img src="docs/settings-1.jpg" width="240" alt="設定画面の上部"></td>
    <td align="center"><img src="docs/settings-2.jpg" width="240" alt="設定画面の下部"></td>
  </tr>
  <tr>
    <td align="center">背景 · 歌詞 · コントロールの自動非表示 · 翻訳</td>
    <td align="center">歌詞ソースの順番 · 言語 · アップデート · ウィンドウ</td>
  </tr>
</table>

スクリーンショットは韓国語の画面です。表示言語は Spotify の言語に合わせて切り替わります（下記参照）。

## 主な機能

- **単語ごとの同期**: 歌っている単語が少し大きくなりながら色が付きます。前奏や間奏では `• • •` が表示されます。
- **ふりがな**: 漢字の上にひらがなの読みを表示します。
- **読み**: 日本語以外の画面では、日本語の歌詞の下にローマ字を表示します。日本語の画面では表示しません。
- **AI 翻訳**: Gemini API キーを入力すると、歌詞の下に画面の言語で翻訳が表示されます。翻訳は曲ごとに一度だけ行い、保存します。
- **歌詞のソース**: Spotify、LRCLIB、LyricsPlus・Lyrically（Apple Music の単語同期歌詞）、NetEase、Musixmatch に同時に問い合わせ、最も良い歌詞を選びます。設定でソースの順番を変えたりオフにしたりでき、曲ごとにソースを固定することもできます。単語ごとのタイミングがどこにもない場合は、行の長さから推定します（設定でオフにできます）。一度取得した歌詞はディスクに保存され、次からはすぐに表示されます。
- **表示言語**: 한국어、English、日本語、简体中文、Español。初期設定では Spotify の言語に合わせ、設定 → 言語で変更できます。
- **その他**: アーティスト・クレジットカード、歌詞のフォント設定（Aa）、スリープタイマー、曲のリンクのコピー。

## インストール

Spotify デスクトップアプリが必要です。以下のコマンドは、Spicetify がなければ一緒にインストールします。
同じコマンドをもう一度実行すると、最新版にアップデートされます。

> **Windows では Microsoft Store 版ではなく、[spotify.com](https://www.spotify.com/download) からダウンロードした Spotify を使ってください。**
> Store 版は Windows がアプリのファイルを元に戻すため、再起動や Store のアップデートのあとにプレーヤー（とほかの Spicetify 拡張すべて）が動かなくなります。
> Spotify が `C:\Program Files\WindowsApps` にある場合は、アンインストールして通常版をインストール（`winget install Spotify.Spotify`）し、一度起動してから `spicetify backup apply` を実行してください。
>
> Spotify が自動アップデートしたあとにプレーヤーが消えたら、`spicetify backup apply` をもう一度実行してください。

**Windows（PowerShell）**

```powershell
iwr -useb https://raw.githubusercontent.com/w2story/wave-player-mobile/main/install.ps1 | iex
```

**macOS / Linux（ターミナル）**

```sh
curl -fsSL https://raw.githubusercontent.com/w2story/wave-player-mobile/main/install.sh | sh
```

### 手動インストール

1. Spicetify Marketplace から元の **Wave Player を削除** します。両方あると片方しか動きません。
2. `waveplayer-mobile.js` を Spicetify の拡張機能フォルダに入れます。
   - Windows: `%APPDATA%\spicetify\Extensions`
   - macOS / Linux: `~/.config/spicetify/Extensions`
3. 次のコマンドを実行します。

```sh
spicetify config extensions waveplayer-mobile.js
spicetify apply
```

`Config "extensions" unchanged ... already in the list` という警告は、すでに登録済みという意味なので無視してかまいません。

## 使い方

| 操作 | 方法 |
| --- | --- |
| ミニプレーヤーを開く | Spotify のミニプレーヤーボタン、または `Ctrl+Shift+M` |
| Canvas ↔ カバー | アルバムアートをクリック |
| 全画面歌詞 | 歌詞プレビューカードをクリック、または `L` |
| 歌詞プレビューの開閉 | カード上部の ⌄ / ⌃ |
| 歌詞のフォント・背景 | カード上部の **Aa** |
| 再生キュー | コントロール右側のリストボタン |
| 設定 | 右上の **⋯** → 設定 |
| 曲のリンクをコピー | 緑のチェックにマウスを乗せると出るリンクボタン、または **⋯** → 曲のリンクをコピー |
| 歌詞のタイミング調整 | `[` / `]`（曲ごとに保存） |
| モバイル表示 ↔ カバー表示 | `M` |

## 注意点

- Spotify に内蔵された Chrome の制限により、ミニプレーヤーのウィンドウは **画面の高さの 80% まで** しか大きくなりません。
- 読みの辞書は、初めて使うときに一度だけダウンロードします（日本語 約 12MB、英語 約 5MB）。
- アーティスト・クレジットカードと Canvas は Spotify アプリの内部 API を使うため、Spotify のバージョンによって動作が変わることがあります。

## クレジット

- 元のプロジェクト: [Wave Player](https://github.com/03x1/Wave-Player)（MIT）
- 歌詞: [LRCLIB](https://lrclib.net)、LyricsPlus（KPoe）、[Lyrically](https://lyrics.paxsenix.org)（Paxsenix）、NetEase、Musixmatch、Spotify
- 日本語の読み: [kuromoji.js](https://github.com/takuyaa/kuromoji.js) · 英語の発音: [CMU Pronouncing Dictionary](https://github.com/words/cmu-pronouncing-dictionary)
- 翻訳: Google Gemini API（ご自身のキー）

MIT ライセンスです。元の著作権表示は [LICENSE](LICENSE) にそのまま残しています。
