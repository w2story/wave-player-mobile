# Wave Player Mobile

[English](README.md) · [한국어](README.ko.md) · [日本語](README.ja.md) · [简体中文](README.zh-CN.md) · **Español**

Un minirreproductor que lleva la **vista móvil de Spotify** a la aplicación de escritorio.
Basado en [Wave Player](https://github.com/03x1/Wave-Player) (una extensión de Spicetify).

<p align="center">
  <img src="docs/phone-canvas.gif" width="300" alt="Letra que se rellena palabra por palabra sobre un vídeo Canvas">
</p>

## Pantallas

### Vista móvil

Es la vista que aparece al abrir el minirreproductor. La línea actual de la letra se muestra sobre el vídeo Canvas o la portada del álbum, con los controles y una tarjeta de vista previa de la letra debajo.

<table>
  <tr>
    <td align="center"><img src="docs/phone-lyrics-open.jpg" width="240" alt="Vista móvil con la vista previa de la letra abierta"></td>
    <td align="center"><img src="docs/phone-lyrics-folded.jpg" width="240" alt="Vista móvil con la vista previa de la letra plegada"></td>
    <td align="center"><img src="docs/phone-cover.jpg" width="240" alt="Vista móvil con la portada del álbum"></td>
  </tr>
  <tr>
    <td align="center">Vista previa abierta</td>
    <td align="center">Vista previa plegada</td>
    <td align="center">Cambiada a la portada</td>
  </tr>
</table>

- Haz clic en la portada para cambiar entre **vídeo Canvas ↔ portada**. Con la portada, el fondo se mueve lentamente con sus colores, como en Apple Music.
- La tarjeta de vista previa se pliega y despliega con ⌄ / ⌃.

### Letra a pantalla completa

<table>
  <tr>
    <td align="center"><img src="docs/lyrics-canvas.jpg" width="240" alt="Letra a pantalla completa sobre un fondo Canvas"></td>
    <td align="center"><img src="docs/lyrics-cover.jpg" width="240" alt="Letra a pantalla completa sobre la portada difuminada"></td>
  </tr>
  <tr>
    <td align="center">Canción con Canvas</td>
    <td align="center">Canción sin Canvas (portada difuminada)</td>
  </tr>
</table>

- El fondo es el Canvas si la canción lo tiene; si no, una portada difuminada como en Apple Music. También hay un fondo de color sólido.
- La palabra que se canta crece un poco mientras se rellena; las introducciones y pausas muestran `• • •`.
- La letra en japonés lleva **furigana** sobre los kanji y **romaji** debajo, que también se rellena con la canción.

### Cola · menú

<table>
  <tr>
    <td align="center"><img src="docs/queue.jpg" width="240" alt="Cola de reproducción"></td>
    <td align="center"><img src="docs/menu.jpg" width="240" alt="Menú de más opciones"></td>
  </tr>
  <tr>
    <td align="center">Cola (arrastra para reordenar, aleatorio · repetir · temporizador)</td>
    <td align="center">Menú ⋯ (ir al álbum o al artista, temporizador, fuente de la letra, ajustes)</td>
  </tr>
</table>

### Ajustes

<table>
  <tr>
    <td align="center"><img src="docs/settings-1.jpg" width="240" alt="Ajustes, parte superior"></td>
    <td align="center"><img src="docs/settings-2.jpg" width="240" alt="Ajustes, parte inferior"></td>
  </tr>
  <tr>
    <td align="center">Fondo · letra · ocultar controles · traducción</td>
    <td align="center">Orden de fuentes · idioma · actualizaciones · ventana</td>
  </tr>
</table>

Las capturas muestran la interfaz en coreano; el reproductor sigue tu idioma (ver abajo).

## Funciones

- **Sincronía por palabra**: la palabra que se canta crece un poco mientras se rellena. Las introducciones y pausas muestran `• • •`.
- **Romaji**: la letra en japonés lleva su lectura en romaji debajo.
- **Furigana**: lectura en hiragana sobre los kanji.
- **Traducción con IA**: añade una clave de API de Gemini y cada línea tendrá su traducción al idioma de la interfaz. Cada canción se traduce una sola vez y se guarda.
- **Fuentes de letras**: se consultan a la vez Spotify, LRCLIB, LyricsPlus · Lyrically (letras de Apple Music sincronizadas por palabra), NetEase y Musixmatch, y gana la mejor letra. En ajustes puedes cambiar el orden o desactivar fuentes, y fijar una fuente para cada canción. Si ninguna tiene sincronía por palabra, se estima a partir de la línea (se puede desactivar). Las letras se guardan en disco, así que las canciones que ya escuchaste aparecen al instante.
- **Idioma de la interfaz**: 한국어, English, 日本語, 简体中文, Español. Sigue el idioma de Spotify por defecto; cámbialo en Ajustes → Idioma.
- **Además**: tarjetas de artista y créditos, ajustes de fuente de la letra (Aa), temporizador y copiar el enlace de la canción.

## Instalación

Necesitas la aplicación de escritorio de Spotify. El comando también instala Spicetify si no lo tienes.
Ejecuta el mismo comando otra vez para actualizar a la última versión.

**Windows (PowerShell)**

```powershell
iwr -useb https://raw.githubusercontent.com/w2story/wave-player-mobile/main/install.ps1 | iex
```

**macOS / Linux (terminal)**

```sh
curl -fsSL https://raw.githubusercontent.com/w2story/wave-player-mobile/main/install.sh | sh
```

### Instalación manual

1. **Desinstala el Wave Player original** del Marketplace de Spicetify. Si están los dos, solo funciona uno.
2. Copia `waveplayer-mobile.js` en la carpeta de extensiones de Spicetify.
   - Windows: `%APPDATA%\spicetify\Extensions`
   - macOS / Linux: `~/.config/spicetify/Extensions`
3. Ejecuta:

```sh
spicetify config extensions waveplayer-mobile.js
spicetify apply
```

El aviso `Config "extensions" unchanged ... already in the list` solo significa que ya está registrada; puedes ignorarlo.

## Uso

| Acción | Cómo |
| --- | --- |
| Abrir el minirreproductor | Botón de minirreproductor de Spotify o `Ctrl+Shift+M` |
| Canvas ↔ portada | Clic en la portada del álbum |
| Letra a pantalla completa | Clic en la tarjeta de vista previa, o `L` |
| Plegar / desplegar la vista previa | ⌄ / ⌃ en la parte superior de la tarjeta |
| Fuente y fondo de la letra | **Aa** en la parte superior de la tarjeta |
| Cola | Botón de lista a la derecha de los controles |
| Ajustes | **⋯** arriba a la derecha → Ajustes |
| Copiar enlace de la canción | Botón de enlace que aparece al pasar el ratón por el check verde, o **⋯** → Copiar enlace de la canción |
| Ajustar la sincronía de la letra | `[` / `]` (se guarda por canción) |
| Vista móvil ↔ vista de portada | `M` |

## A tener en cuenta

- Por las limitaciones del Chrome integrado en Spotify, la ventana del minirreproductor solo crece hasta el **80 % de la altura de la pantalla**.
- Los diccionarios de pronunciación se descargan una vez, la primera vez que se necesitan (japonés unos 12 MB, inglés unos 5 MB).
- Las tarjetas de artista y créditos y el Canvas usan APIs internas de Spotify, así que pueden comportarse distinto según la versión de Spotify.

## Créditos

- Original: [Wave Player](https://github.com/03x1/Wave-Player) (MIT)
- Letras: [LRCLIB](https://lrclib.net), LyricsPlus (KPoe), [Lyrically](https://lyrics.paxsenix.org) (Paxsenix), NetEase, Musixmatch, Spotify
- Lecturas en japonés: [kuromoji.js](https://github.com/takuyaa/kuromoji.js) · Pronunciación en inglés: [CMU Pronouncing Dictionary](https://github.com/words/cmu-pronouncing-dictionary)
- Traducción: Google Gemini API (con tu propia clave)

Licencia MIT. El aviso de copyright original se mantiene en [LICENSE](LICENSE).
