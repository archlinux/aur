# betasharp-git

AUR package for [BetaSharp](https://git.gay/betasharp-official/betasharp), an enhanced
recreation of Minecraft Beta 1.7.3 written in C# on .NET.

This repo holds only the AUR packaging (`PKGBUILD`, `.desktop` file). Source lives in the
upstream repo, cloned at build time.

## What it does

- Clones `betasharp-official/betasharp` (`main` branch) and runs
  `dotnet publish BetaSharp.Launcher -r linux-x64 --self-contained` — this also builds and
  bundles the Client and Server (see the Launcher's `_CopyClientOutput`/`_CopyServerOutput`
  MSBuild targets).
- Installs the published output (read-only) to `/usr/lib/betasharp`.
- Installs a `/usr/bin/betasharp` wrapper. On first run (or after an update) it stages a
  writable copy of the game files to `$XDG_DATA_HOME/betasharp` (usually
  `~/.local/share/betasharp`) and runs from there.
- Installs `betasharp.desktop` and an icon.

## Why the staging wrapper

The Launcher downloads the game jar (`b1.7.3.jar`) into the same directory as its own
binary (`AppContext.BaseDirectory/Client` and `/Server` — see
`BetaSharp.Launcher/Features/MinecraftService.cs` and `ProcessService.cs`). That directory
is `/usr/lib/betasharp` under this package, which is root-owned and read-only for normal
users. The wrapper works around this without patching upstream by copying the whole
install to a per-user writable location before running. Costs ~300 MB of duplicated
storage per user and a re-copy on every version bump; the real fix is upstream (resolve
an XDG data dir instead of `AppContext.BaseDirectory`) — worth a PR against
`betasharp-official/betasharp` at some point, at which point this wrapper can go away.

## Dependencies

- `dotnet-sdk` — build only (`makedepends`), not needed at runtime: the publish output is
  self-contained (bundles its own .NET runtime).
- `gtk3`, `webkit2gtk-4.1` — pulled in transitively by `libmsalruntime.so` (Microsoft auth
  broker used by the Launcher's login flow), confirmed via `ldd`.

## Local test build

```sh
makepkg -si
```

To test just the build/package logic without touching the system:

```sh
makepkg -o   # fetch + extract only
makepkg -e   # build only, skip re-download
```

## Publishing to AUR

Not yet published. Once ready:

```sh
makepkg --printsrcinfo > .SRCINFO
git remote add aur ssh://aur@aur.archlinux.org/betasharp-git.git
git push aur main
```
