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

### Why `makepkg` used to fail with HTTP 403

`codemeyo.com` sits behind a firewall that rejects curl's stock User-Agent
(`curl/8.x`) on a cold connection:

```
curl: (22) The requested URL returned error: 403
```

Any browser-like UA is accepted, and a successful request leaves that IP
trusted for a short while — which is why a manual `curl -A Mozilla/...` works
while a plain `makepkg` does not. The PKGBUILD therefore overrides `DLAGENTS`
for `http`/`https` with a curl invocation that sends `-A Mozilla/5.0` (the UA
must be space-free, as `DLAGENTS` entries are word-split) and retries
transient failures.

Because this keeps the stock download logic otherwise intact, nothing else
changes; if upstream ever serves these files without the firewall, the
`DLAGENTS` block can be dropped.

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

## Blank/grey window on startup

Symptom: the window opens but stays empty/grey; the process does not exit, so
it does not look like a crash. The journal shows what actually happens:

```
codemeyo.desktop[…]: Could not create default EGL display: EGL_BAD_PARAMETER. Aborting...
systemd-coredump[…]: Process … (WebKitWebProces) of user … dumped core.
```

WebKitGTK's web process aborts while initialising EGL, so nothing is ever
rendered inside the window.

The cause is inside the AppImage: it ships its own `libwayland-client.so.0` and
`libwayland-egl.so.1`, built against an older libwayland than a current Arch
system has. When the bundled copy wins over the system one, EGL initialisation
fails. The `/usr/bin/codemeyo` launcher therefore preloads the system
`libwayland-client.so.0`, which makes the dynamic loader satisfy the `NEEDED`
entry from `/usr/lib` instead of the bundle.

Setting `WEBKIT_DISABLE_DMABUF_RENDERER`, `WEBKIT_DISABLE_COMPOSITING_MODE`,
`WEBKIT_DISABLE_SANDBOX_THIS_IS_DANGEROUS` or `LIBGL_ALWAYS_SOFTWARE` does
**not** help — the abort happens before those code paths are reached. Removing
the bundled `libwayland*` files altogether (e.g. by shipping an extracted tree
instead of the AppImage) works too, but the preload keeps the package as a
single upstream artifact.

