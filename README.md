# Wave Player Mobile

**English** · [한국어](README.ko.md) · [日本語](README.ja.md) · [简体中文](README.zh-CN.md) · [Español](README.es.md)

A mini player that brings the **Spotify mobile layout** to the Spotify desktop app.
Built on [Wave Player](https://github.com/03x1/Wave-Player) (a Spicetify extension).

<p align="center">
  <img src="docs/phone-canvas.gif" width="300" alt="Lyrics filling in word by word over a Canvas video">
</p>

## Screens

### Phone view

The default view when the mini player opens. The current lyric line sits over the Canvas video or album cover, with the controls and a lyrics preview card below.

<table>
  <tr>
    <td align="center"><img src="docs/phone-lyrics-open.jpg" width="240" alt="Phone view with the lyrics preview open"></td>
    <td align="center"><img src="docs/phone-lyrics-folded.jpg" width="240" alt="Phone view with the lyrics preview folded"></td>
    <td align="center"><img src="docs/phone-cover.jpg" width="240" alt="Phone view switched to the album cover"></td>
  </tr>
  <tr>
    <td align="center">Lyrics preview open</td>
    <td align="center">Lyrics preview folded</td>
    <td align="center">Switched to the cover</td>
  </tr>
</table>

- Click the album art to switch between **Canvas video ↔ cover**. With the cover, the background slowly moves through the cover's colours, like Apple Music.
- Fold and unfold the lyrics preview card with ⌄ / ⌃.

### Full-screen lyrics

<table>
  <tr>
    <td align="center"><img src="docs/lyrics-canvas.jpg" width="240" alt="Full-screen lyrics over a Canvas background"></td>
    <td align="center"><img src="docs/lyrics-cover.jpg" width="240" alt="Full-screen lyrics over a blurred cover"></td>
  </tr>
  <tr>
    <td align="center">Song with a Canvas</td>
    <td align="center">Song without one (blurred cover)</td>
  </tr>
</table>

- The background is the Canvas when the song has one, otherwise a blurred cover like Apple Music. A solid colour is also available.
- The word being sung grows slightly as it fills in; intros and breaks show `• • •`.
- Japanese lyrics get **furigana** above the kanji and a **pronunciation** line below, which fills in with the words too.

### Queue · menu

<table>
  <tr>
    <td align="center"><img src="docs/queue.jpg" width="240" alt="Queue sheet"></td>
    <td align="center"><img src="docs/menu.jpg" width="240" alt="More menu"></td>
  </tr>
  <tr>
    <td align="center">Queue (drag to reorder, shuffle · repeat · timer)</td>
    <td align="center">⋯ menu (go to album or artist, sleep timer, lyrics source, settings)</td>
  </tr>
</table>

### Settings

<table>
  <tr>
    <td align="center"><img src="docs/settings-1.jpg" width="240" alt="Settings, top"></td>
    <td align="center"><img src="docs/settings-2.jpg" width="240" alt="Settings, bottom"></td>
  </tr>
  <tr>
    <td align="center">Background · lyrics · auto-hide controls · translation</td>
    <td align="center">Lyric source order · language · updates · window</td>
  </tr>
</table>

The screenshots show the Korean interface; the player follows your language (see below).

## Features

- **Word-by-word sync**: the word being sung grows slightly as it fills in. Intros and breaks show `• • •`.
- **Pronunciation**: Japanese lyrics get romaji underneath. With the Korean interface, Japanese (kuromoji) and English (CMU Pronouncing Dictionary) lyrics get Hangul pronunciation instead.
- **Furigana**: hiragana readings above kanji.
- **AI translation**: add a Gemini API key and each line gets a translation into your interface language. Each song is translated once and saved.
- **Lyric sources**: Spotify, LRCLIB, LyricsPlus · Lyrically (Apple Music word-synced lyrics), NetEase and Musixmatch are asked at once and the best lyrics win. You can reorder or turn off sources in settings, or pin a source per song. When no source has word timings, they're estimated from the line (can be turned off). Lyrics are cached on disk, so songs you've heard before show up instantly.
- **Interface language**: 한국어, English, 日本語, 简体中文, Español. Follows Spotify's language by default; change it under Settings → Language.
- **Also**: artist and credits cards, lyrics font settings (Aa), sleep timer, copy song link.

## Install

You need the Spotify desktop app. The command below also installs Spicetify if it's missing.
Run the same command again to update to the latest version.

> **Windows: use the Spotify from [spotify.com](https://www.spotify.com/download), not the Microsoft Store one.**
> Windows restores the Store app's files, so the player (and every other Spicetify extension) stops working after a restart or a Store update.
> If yours is in `C:\Program Files\WindowsApps`, uninstall it, install the regular version (`winget install Spotify.Spotify`), open it once, then run `spicetify backup apply`.
>
> If the player disappears after Spotify updates itself, run `spicetify backup apply` again.

**Windows (PowerShell)**

```powershell
iwr -useb https://raw.githubusercontent.com/w2story/wave-player-mobile/main/install.ps1 | iex
```

**macOS / Linux (terminal)**

```sh
curl -fsSL https://raw.githubusercontent.com/w2story/wave-player-mobile/main/install.sh | sh
```

### Manual install

1. **Remove the original Wave Player** from the Spicetify Marketplace. If both are installed, only one works.
2. Put `waveplayer-mobile.js` in the Spicetify extensions folder.
   - Windows: `%APPDATA%\spicetify\Extensions`
   - macOS / Linux: `~/.config/spicetify/Extensions`
3. Run:

```sh
spicetify config extensions waveplayer-mobile.js
spicetify apply
```

A `Config "extensions" unchanged ... already in the list` warning just means it's already registered; you can ignore it.

## Usage

| Action | How |
| --- | --- |
| Open the mini player | Spotify's mini player button or `Ctrl+Shift+M` |
| Canvas ↔ cover | Click the album art |
| Full-screen lyrics | Click the lyrics preview card, or `L` |
| Fold / unfold the lyrics preview | ⌄ / ⌃ at the top of the card |
| Lyrics font and background | **Aa** at the top of the card |
| Queue | The list button to the right of the controls |
| Settings | **⋯** at the top right → Settings |
| Copy song link | The link button that appears when hovering the green check, or **⋯** → Copy Song Link |
| Adjust lyrics timing | `[` / `]` (saved per song) |
| Phone view ↔ cover view | `M` |

## Good to know

- Because of limits in the Chrome built into Spotify, the mini player window only grows to **80% of the screen height**.
- Pronunciation dictionaries are downloaded once, the first time they're needed (Japanese about 12 MB, English about 5 MB).
- The artist and credits cards and Canvas use Spotify's internal APIs, so they may behave differently across Spotify versions.

## Credits

- Original: [Wave Player](https://github.com/03x1/Wave-Player) (MIT)
- Lyrics: [LRCLIB](https://lrclib.net), LyricsPlus (KPoe), [Lyrically](https://lyrics.paxsenix.org) (Paxsenix), NetEase, Musixmatch, Spotify
- Japanese readings: [kuromoji.js](https://github.com/takuyaa/kuromoji.js) · English pronunciation: [CMU Pronouncing Dictionary](https://github.com/words/cmu-pronouncing-dictionary)
- Translation: Google Gemini API (your own key)

MIT licensed. The original copyright notice is kept in [LICENSE](LICENSE).
