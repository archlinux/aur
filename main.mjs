// GambiarraInfinite V4 (Linux port) — Electron entry shim.
//
// Why this exists:
//   The Windows build ships a self-contained Electron runtime, so the app finds
//   its resources with `process.resourcesPath` pointing next to the executable.
//   On Linux we reuse the distro `electron` and its Arch wrapper, which forces
//   `app.isPackaged === true` (ELECTRON_FORCE_IS_PACKAGED). In that mode the app
//   resolves `opencode-cli` / `icons` against process.resourcesPath, which is the
//   *system* Electron directory (/usr/lib/electron44/resources) and does not
//   contain them -> `spawn /usr/lib/electron44/resources/opencode-cli ENOENT`.
//
//   This shim repoints process.resourcesPath at this app directory before the
//   untouched bundle is loaded, so the app finds its own CLI, icons and version
//   file regardless of how the distro Electron reports isPackaged.
//
// Approach mirrors the upstream `opencode-desktop-bin` AUR package.

import { app } from "electron"
import { existsSync, mkdirSync, readFileSync, symlinkSync } from "node:fs"
import { dirname, join } from "node:path"

Object.defineProperty(process, "resourcesPath", {
  value: import.meta.dirname,
  configurable: true,
})

// When packaged the app stages its own copy of the CLI under
// <userData>/cli/<version>-<arch> and will happily copy a 200 MB binary on first
// launch. Pre-seeding a symlink to the packaged CLI makes it reuse that instead,
// so only one copy exists on disk. The directory name must match the app's own
// `${version}-${process.arch}` convention (sanitised the same way), or the app
// will not see the symlink and copies the binary regardless.
const stageDir = (version) =>
  `${version}-${process.arch}`.replace(/[^a-zA-Z0-9._-]/g, "-")

const linkCli = (userData) => {
  try {
    const version = readFileSync(join(import.meta.dirname, "opencode-cli.version"), "utf8").trim()
    if (!version) return
    const dir = join(userData, "cli", stageDir(version))
    const link = join(dir, "opencode-cli")
    if (!existsSync(link)) {
      mkdirSync(dir, { recursive: true })
      symlinkSync(join(import.meta.dirname, "opencode-cli"), link)
    }
    // The CLI runs `warp-install.sh` from next to its own executable; keep the
    // installer beside the staged CLI too, or the WARP install button fails.
    const installer = join(import.meta.dirname, "warp-install.sh")
    const installerLink = join(dir, "warp-install.sh")
    if (existsSync(installer) && !existsSync(installerLink)) {
      mkdirSync(dir, { recursive: true })
      symlinkSync(installer, installerLink)
    }
  } catch {}
}

const setPath = app.setPath.bind(app)
app.setPath = (name, value) => {
  setPath(name, value)
  if (name === "userData") linkCli(value)
}
app.whenReady().then(() => linkCli(app.getPath("userData")))

await import("./out/main/index.js")
