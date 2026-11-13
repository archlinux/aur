# simpleems — Arch package

PKGBUILD for [simpleEMS](https://github.com/MohamoudAli12/simpleEMS) (AGPL-3.0-or-later),
a design/simulation framework built on top of openEMS. It is not in the AUR, so this is a
local package directory.

## Why the package looks unusual

Upstream pins every dependency exactly (`numpy==2.4.4`, `cadquery==2.8.0`,
`pyvista==0.48.4`, `pyqt6==6.10.1`, ...) and keeps `uv.lock` as the source of truth.
Several of those have no matching Arch package (`cadquery`, `pysmithchart`, `pyvistaqt`),
and the system Python is 3.14 while `cadquery-ocp 7.9.3.1` only ships up to `cp313`
wheels:

```
error: Distribution `cadquery-ocp==7.9.3.1 @ registry+https://pypi.org/simple`
can't be installed because it doesn't have a source distribution or wheel for the
current platform
hint: You're using CPython 3.14 (`cp314`), but `cadquery-ocp` (v7.9.3.1) only has
wheels with the following Python ABI tags: `cp311`, `cp312`, `cp313`
```

So the package is self-contained instead of linking against system Python packages:

| path                    | contents                                              |
| ----------------------- | ----------------------------------------------------- |
| `/opt/simpleems/python` | uv-managed CPython 3.13 (python-build-standalone)     |
| `/opt/simpleems/venv`   | venv created with `uv sync --frozen` from `uv.lock`   |
| `/usr/bin/simpleems`    | symlink to `/opt/simpleems/venv/bin/simpleems`        |

Nothing outside those paths is replaced, so no installed package is touched, removed or
downgraded. Installed size is ~1.6 GiB (OCP, VTK, PyQt6, casadi, llvmlite).

## Build and install

```bash
cd simpleems
makepkg -si            # builds and installs, asks for the sudo password once
```

`uv` (from `extra`) is a makedepend; `makepkg -si` installs it automatically.
A prebuilt package is already in this directory, so installing is just:

```bash
sudo pacman -U simpleems-0.4.0-1-x86_64.pkg.tar.zst
```

## Solver backends (optional, needed for actual simulations)

The plotting/export code works, but the design modules import `CSXCAD` at module level, so the openEMS stack is needed for anything beyond `checkhealth`:

* **getdp** (FEM): `paru -S getdp`, plain binary, works as-is.
* **openEMS/CSXCAD** (FDTD): `simpleems install openems` (i.e. upstream `update_openEMS.sh`)
  builds the C++ libraries fine but dies at `pip install .` with
  `CalledProcessError ... '--python-venv-mode', 'auto']' returned non-zero exit status 1`,
  for two reasons: uv-made venvs have **no pip**, and the `v0.7.0` tag's python bindings
  declare `float* GetVertex()` while the C++ header returns `double*`, so they do not compile.
  Prebuilt bindings (from upstream master, against `/opt/openEMS`) are in `openems-bindings/`:

```bash
sudo bash openems-bindings/install.sh
```

Then verify with:

```bash
simpleems checkhealth
```

## Usage

```bash
simpleems --help
simpleems checkhealth
```

## Notes

* The venv is tied to CPython 3.13. Moving to 3.14 needs `cadquery-ocp` cp314 wheels
  (OCP ≥ 8 / cadquery ≥ 2.9) and a corresponding `_pyver` bump.
* To package git snapshots instead, use a `-git` pkgname with
  `source=("git+$url.git")`, `pkgver()` with `git describe`, and `sha256sums=('SKIP')`.
* `.SRCINFO` is generated (`makepkg --printsrcinfo > .SRCINFO`) and ready for an AUR
  submission if you ever want to upload it.
* Uninstall: `sudo pacman -R simpleems` (removes `/opt/simpleems` as well).
* Rebuild from scratch: `makepkg -f` (the source tarball `v0.4.0.tar.gz` is kept here so
  the download can be reused).

## If this is submitted to the AUR (yay / paru)

The AUR stores only the recipe (`PKGBUILD`, `.SRCINFO`, `simpleems.install` — about 8 KiB),
never the 464 MiB package: the helper rebuilds it locally. Expect, in this order:

1. **Build downloads ~1 GB.** `uv sync --frozen` fetches a managed CPython 3.13.18
   (~105 MiB) plus the pinned wheels from PyPI at build time, because `source=()` only
   carries the upstream tarball. This is the main packaging-policy objection; a strict
   reviewer may ask for the wheels to be declared as sources (impractical: ~200 files,
   but `uv.lock` does verify each wheel's sha256).
2. **Build takes ~5–15 min and produces 20 272 files / 1.7 GiB** — unusual for the AUR,
   so `yay -S simpleems` looks stalled for a while during "Installing package".
3. **`x86_64` only.** The pinned `gmsh==4.14.1` has no Linux aarch64 wheel (no sdist
   either), so an aarch64 build fails in `uv sync`.
4. **The solver is still missing after install.** `simpleems checkhealth` shows
   `14 passed / 5 failed` and `simpleEMS.components` raises `ModuleNotFoundError:
   No module named 'CSXCAD'`. Installing the AUR `openems` optdepend does *not* fix this
   (bindings are built for the system Python), so the `.install` script prints the
   `simpleems install openems` command instead.
