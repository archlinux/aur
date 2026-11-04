# basalt-inference-git

Arch package for <https://github.com/jesdga95/basalt> tracking `main`, plus two local patches.

```
PKGBUILD
.SRCINFO
0001-cmake-overridable-basalt-source-dir.patch   BASALT_SOURCE_DIR becomes a cmake cache variable
ram-guard-mib.patch                              --ram-guard-mib N (0 = the RAM guard off)
.gitignore                                       `*` plus five negations: the files above, nothing else
```

Written by an LLM: Qwen3.8-Flash-Next (`Qwen3.8-FN-GSQ-RCO-IQ3_S`) running on basalt, the very
engine this package builds, with a human driving, reviewing and running every build.

## Naming

The package and the commands it puts on `PATH` are qualified: `basalt` is taken in AUR by unrelated
software (`aur/basalt` and `aur/basalt-bin`, a TUI for Obsidian, both own `/usr/bin/basalt`; there
is also the vkBasalt Vulkan-layer family and `basalt-monado`, a SLAM library).

| on PATH | runs the tree binary |
| --- | --- |
| `basalt-inference` | `/usr/lib/basalt/bin/basalt` |
| `basalt-inference-probe` | `/usr/lib/basalt/bin/basalt-probe` |
| `basalt-inference-bench` | `/usr/lib/basalt/bin/basalt-bench` |
| `basalt-inference-vision` | `/usr/lib/basalt/bin/basalt-vision` |

Inside `/usr/lib/basalt/bin/` the files keep upstream's names — that path is what `basalt-probe` and
`basalt-bench` bake in as their engine, and upstream docs' `basalt serve` is this package's
`basalt-inference serve`.

## Build / update

```sh
makepkg -si                             # installs dependencies as needed
BASALT_JOBS=2 makepkg -si               # if the CUDA compile thrashes RAM: peak nvcc memory scales with -j
${AUR_HELPER} -S basalt-inference-git   # or via an AUR helper once this dir is added to it
```

Both patches apply to upstream main through `1b3f6964` (v0.2.1, checked 2026-11-04).

`makepkg` prints *"Package contains reference to $srcdir"* for `basalt` and `basalt-bench`: a few
`__FILE__`-style log strings in the ggml kernels, and bench's path to a dev program this package does
not ship. Nothing that is used as a path: those all point at `/usr/lib/basalt`.

## Running the installed engine

```sh
mkdir -p ~/.config/basalt
nano ~/.config/basalt/basalt_config.json
basalt-inference serve --config ~/.config/basalt/basalt_config.json
```

`/usr/lib/basalt` is root-owned, so anything the engine writes must be a path you own
(`--expert-profile-save`, `--shared-expert-arena`), and `basalt-inference-bench --community` (which writes
`docs/community/benchmarks.json` in its tree) is unavailable from the package.

## What the package does

- Binaries → `/usr/lib/basalt/bin/{basalt,basalt-bench,basalt-probe,basalt-vision}`, symlinked into
  `/usr/bin` under qualified names (see Naming). Upstream has no `install()` rules and puts them in
  the source tree's `bin/`.
- `serve/`, `tools/`, `data/` → `/usr/lib/basalt/`, because the engine's `serve` subcommand chdirs to the compiled-in
  `BASALT_SOURCE_DIR`, runs `python3 -m serve.server` from there, and the engine reads
  `data/profiles/*.prof` from it. Patch 0001 makes that path settable
  (`-DBASALT_SOURCE_DIR=/usr/lib/basalt`); without it the binary would point at the deleted build
  tree and `basalt serve` would fail with *cannot enter the source tree*.
- Patch 0001 also makes the engine path a cmake option (`-DBASALT_ENGINE_BIN=/usr/lib/basalt/bin/basalt`)
  and points `BASALT_BENCH_FIXTURES` / `BASALT_BENCH_SOURCE_DIR` at the installed `data/bench`:
  `basalt-probe` and `basalt-bench` otherwise bake in the build tree and refuse to run after install
  (`the engine binary … does not exist`). `package()` greps for this and fails the build otherwise.
  `basalt-bench`'s device-kernel path still names `basalt-device`, which upstream builds into the
  build directory and this package does not ship.
- Python deps come from [extra] (`python-numpy python-jinja python-markupsafe python-regex
  python-yaml python-tqdm python-pillow python-psutil`); `requirements.txt` pins are ignored.
- `cuda` is a runtime dep too (`libcudart/libcublas/libcublasLt`); the driver is left to you.
- `package()` fails the build if either patch is missing from the installed binary, so an update can
  never silently drop `--ram-guard-mib`.

## When `prepare()` aborts

`git am --3way` failed: upstream moved one of the patched files.

```sh
# set these two to your paths: your basalt checkout, and this package directory
CHECKOUT=~/src/basalt
PKGDIR=~/pkg/basalt-inference-git

# 1. reproduce in a scratch clone, with the patch on top of the new main
git clone --no-hardlinks "$CHECKOUT" /tmp/rebase && cd /tmp/rebase
git fetch origin main && git checkout -q origin/main
git am --3way "$PKGDIR/ram-guard-mib.patch"
#    when only docs/ and tests/ conflict, drop those hunks (the patch is source-only):
git checkout HEAD -- docs tests 2>/dev/null
#    otherwise resolve the conflicts (usually the context around --vram-reserve-mib in
#    src/program/cli/arguments.cpp, guard_floor in src/program/serve/memory.cpp,
#    the Options block in include/basalt/program/options.hpp), then:
git add -A && git am --continue
# 2. export it under the same name and refresh the sum
git format-patch -1 --stdout > "$PKGDIR/ram-guard-mib.patch"
sha256sum "$PKGDIR/ram-guard-mib.patch"                 # put this in sha256sums[]
# 3. rebuild
cd "$PKGDIR" && rm -rf src pkg && makepkg -si
```

The same loop fixes patch 0001 (its hunk is the `target_compile_definitions(basalt PRIVATE
BASALT_SOURCE_DIR=...)` line near `CMakeLists.txt:532`).

If you re-do the RAM-guard change in your own checkout instead, regenerate from there — a throwaway
clone keeps your dirty worktree untouched:

```sh
# CHECKOUT and PKGDIR as above
BASE=$(git -C "$CHECKOUT" rev-parse --short HEAD)
git clone -q --no-hardlinks "$CHECKOUT" /tmp/basalt-patchgen
git -C /tmp/basalt-patchgen checkout -q "$BASE"
git -C "$CHECKOUT" diff --name-only HEAD -- include src tests docs \
  | while read -r f; do install -Dm644 "$CHECKOUT/$f" "/tmp/basalt-patchgen/$f"; done
git -C /tmp/basalt-patchgen commit -aqm "ram-guard: --ram-guard-mib N (0 = the RAM guard off)"
git -C /tmp/basalt-patchgen format-patch -1 --stdout > "$PKGDIR/ram-guard-mib.patch"
rm -rf /tmp/basalt-patchgen        # then refresh sha256sums[]
```
