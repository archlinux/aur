# codemeyo-bin

Arch Linux binary package for [CodeMeYo](https://codemeyo.com), a multi-LLM
autonomous coding agent (Claude, GPT, Grok, Gemini, DeepSeek, Mistral, Ollama,
Groq).

## Install

```sh
makepkg -si
```

The package installs the upstream AppImage to `/opt/codemeyo/CodeMeYo.AppImage`
and a `/usr/bin/codemeyo` launcher, plus a desktop entry and icon.

## Source URL

Upstream publishes Linux builds only through the e-mail form at
<https://codemeyo.com/download/linux>; the form streams the file and exposes no
versioned URL. The desktop auto-updater serves the very same artifact from a
public, login-free endpoint:

```
https://codemeyo.com/api/v1/updater/files/62
```

`62` currently maps to `CodeMeYo_1.11.7_amd64.AppImage` (sha256
`6adbbc…a878`), which is exactly the file the download form returns. The
`_fileid` variable in the PKGBUILD tracks it.

## Updating

1. Download the latest Linux AppImage from the form and note its filename.
2. Find the matching public id by checking
   `https://codemeyo.com/api/v1/updater/files/<id>` — the
   `Content-Disposition` header reports the filename. Ids are sequential, so
   start near the current `_fileid`.
3. Update `pkgver`, `_fileid`, and `sha256sums`, then run
   `makepkg --printsrcinfo > .SRCINFO` and rebuild.

## Notes

- The AppImage bundles WebKitGTK/GTK, so the only runtime dependency is
  `fuse2`.
- In-app self-updates cannot replace the root-owned copy in `/opt`; updates
  come through pacman.
- Upstream's README declares the project MIT-licensed but the repository does
  not ship a `LICENSE` file, so none is installed.
