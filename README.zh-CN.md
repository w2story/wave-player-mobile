# Wave Player Mobile

[English](README.md) · [한국어](README.ko.md) · [日本語](README.ja.md) · **简体中文** · [Español](README.es.md)

一个在 Spotify 桌面应用中使用 **Spotify 手机版界面** 的迷你播放器。
基于 [Wave Player](https://github.com/03x1/Wave-Player)（Spicetify 扩展）制作。

<p align="center">
  <img src="docs/phone-canvas.gif" width="300" alt="Canvas 视频上逐字填充的歌词">
</p>

## 界面

### 手机视图

打开迷你播放器时默认显示的界面。Canvas 视频或专辑封面上显示当前的一行歌词，下方是播放控件和歌词预览卡片。

<table>
  <tr>
    <td align="center"><img src="docs/phone-lyrics-open.jpg" width="240" alt="展开歌词预览的手机视图"></td>
    <td align="center"><img src="docs/phone-lyrics-folded.jpg" width="240" alt="收起歌词预览的手机视图"></td>
    <td align="center"><img src="docs/phone-cover.jpg" width="240" alt="切换为专辑封面的手机视图"></td>
  </tr>
  <tr>
    <td align="center">展开歌词预览</td>
    <td align="center">收起歌词预览</td>
    <td align="center">切换为专辑封面</td>
  </tr>
</table>

- 每次点击专辑封面，都会在 **Canvas 视频 ↔ 封面** 之间切换。显示封面时，背景会像 Apple Music 一样随封面颜色缓缓流动。
- 歌词预览卡片可以用 ⌄ / ⌃ 收起和展开。

### 全屏歌词

<table>
  <tr>
    <td align="center"><img src="docs/lyrics-canvas.jpg" width="240" alt="Canvas 背景的全屏歌词"></td>
    <td align="center"><img src="docs/lyrics-cover.jpg" width="240" alt="模糊封面背景的全屏歌词"></td>
  </tr>
  <tr>
    <td align="center">有 Canvas 的歌曲</td>
    <td align="center">没有 Canvas 的歌曲（模糊封面）</td>
  </tr>
</table>

- 有 Canvas 时以 Canvas 为背景，没有时像 Apple Music 一样使用模糊的封面。也可以选择纯色背景。
- 正在唱的字会稍微放大并逐渐填充，前奏和间奏显示 `• • •`。
- 日语歌词的汉字上方会显示 **假名注音**，下方显示 **罗马音**，罗马音也会随演唱逐字填充。

### 播放队列 · 菜单

<table>
  <tr>
    <td align="center"><img src="docs/queue.jpg" width="240" alt="播放队列"></td>
    <td align="center"><img src="docs/menu.jpg" width="240" alt="更多菜单"></td>
  </tr>
  <tr>
    <td align="center">播放队列（拖动排序，随机 · 重复 · 定时）</td>
    <td align="center">⋯ 菜单（转到专辑或艺人、睡眠定时、歌词来源、设置）</td>
  </tr>
</table>

### 设置

<table>
  <tr>
    <td align="center"><img src="docs/settings-1.jpg" width="240" alt="设置页面上半部分"></td>
    <td align="center"><img src="docs/settings-2.jpg" width="240" alt="设置页面下半部分"></td>
  </tr>
  <tr>
    <td align="center">背景 · 歌词 · 自动隐藏控件 · 翻译</td>
    <td align="center">歌词来源顺序 · 语言 · 更新 · 窗口</td>
  </tr>
</table>

截图为韩语界面；播放器会跟随你的语言显示（见下文）。

## 主要功能

- **逐字同步**：正在唱的字会稍微放大并逐渐填充。前奏和间奏显示 `• • •`。
- **罗马音**：日语歌词下方显示罗马音（romaji）。
- **假名注音**：在汉字上方显示平假名读音。
- **AI 翻译**：填入 Gemini API 密钥后，每行歌词下方会显示界面语言的翻译。每首歌只翻译一次并保存。
- **歌词来源**：同时请求 Spotify、LRCLIB、LyricsPlus · Lyrically（Apple Music 逐字歌词）、NetEase 和 Musixmatch，选出最好的歌词。可以在设置中调整来源顺序或关闭某个来源，也可以为每首歌固定来源。所有来源都没有逐字时间时，会按行长度估算（可在设置中关闭）。获取过的歌词会保存在磁盘上，下次立即显示。
- **界面语言**：한국어、English、日本語、简体中文、Español。默认跟随 Spotify 的语言，可在 设置 → 语言 中更改。
- **其他**：艺人和制作人员卡片、歌词字体设置（Aa）、睡眠定时、复制歌曲链接。

## 安装

需要 Spotify 桌面应用。以下命令会在没有 Spicetify 时一并安装。
再次运行同一命令即可更新到最新版本。

> **Windows 上请使用从 [spotify.com](https://www.spotify.com/download) 下载的 Spotify，而不是 Microsoft Store 版。**
> Windows 会把 Store 版的应用文件还原，所以重启或 Store 更新后，播放器（以及其他所有 Spicetify 扩展）都会失效。
> 如果 Spotify 位于 `C:\Program Files\WindowsApps`，请先卸载，再安装普通版（`winget install Spotify.Spotify`），打开一次后运行 `spicetify backup apply`。
>
> 如果 Spotify 自动更新后播放器消失了，再运行一次 `spicetify backup apply` 即可。

**Windows（PowerShell）**

```powershell
iwr -useb https://raw.githubusercontent.com/w2story/wave-player-mobile/main/install.ps1 | iex
```

**macOS / Linux（终端）**

```sh
curl -fsSL https://raw.githubusercontent.com/w2story/wave-player-mobile/main/install.sh | sh
```

### 手动安装

1. 在 Spicetify Marketplace 中 **卸载原版 Wave Player**。两者同时存在时只有一个能运行。
2. 将 `waveplayer-mobile.js` 放入 Spicetify 扩展文件夹。
   - Windows：`%APPDATA%\spicetify\Extensions`
   - macOS / Linux：`~/.config/spicetify/Extensions`
3. 运行以下命令。

```sh
spicetify config extensions waveplayer-mobile.js
spicetify apply
```

出现 `Config "extensions" unchanged ... already in the list` 警告表示已经注册过，可以忽略。

## 使用方法

| 操作 | 方法 |
| --- | --- |
| 打开迷你播放器 | Spotify 的迷你播放器按钮，或 `Ctrl+Shift+M` |
| Canvas ↔ 封面 | 点击专辑封面 |
| 全屏歌词 | 点击歌词预览卡片，或按 `L` |
| 收起 / 展开歌词预览 | 卡片顶部的 ⌄ / ⌃ |
| 歌词字体和背景 | 卡片顶部的 **Aa** |
| 播放队列 | 控件右侧的列表按钮 |
| 设置 | 右上角 **⋯** → 设置 |
| 复制歌曲链接 | 鼠标悬停在绿色勾号上出现的链接按钮，或 **⋯** → 复制歌曲链接 |
| 调整歌词时间 | `[` / `]`（按歌曲保存） |
| 手机视图 ↔ 封面视图 | `M` |

## 注意事项

- 由于 Spotify 内置 Chrome 的限制，迷你播放器窗口最多只能放大到 **屏幕高度的 80%**。
- 读音词典会在第一次使用时下载一次（日语约 12MB，英语约 5MB）。
- 艺人和制作人员卡片以及 Canvas 使用 Spotify 应用的内部 API，不同版本的 Spotify 上表现可能不同。

## 致谢

- 原项目：[Wave Player](https://github.com/03x1/Wave-Player)（MIT）
- 歌词：[LRCLIB](https://lrclib.net)、LyricsPlus（KPoe）、[Lyrically](https://lyrics.paxsenix.org)（Paxsenix）、NetEase、Musixmatch、Spotify
- 日语读音：[kuromoji.js](https://github.com/takuyaa/kuromoji.js) · 英语发音：[CMU Pronouncing Dictionary](https://github.com/words/cmu-pronouncing-dictionary)
- 翻译：Google Gemini API（使用你自己的密钥）

采用 MIT 许可证。原项目的版权声明完整保留在 [LICENSE](LICENSE) 中。
