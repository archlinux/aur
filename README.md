# basalt-inference-git

Arch package for <https://github.com/jesdga95/basalt> tracking `main`, plus one local patch.

```
PKGBUILD
.SRCINFO
0001-cmake-installed-runtime-tree.patch   the installed tree and the engine path become cmake options
.gitignore                                `*` plus eight negations: the files above, nothing else
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

The patch applies to upstream main through `9e8fb6a8` (50 commits past v0.3.2, checked 2026-11-09), with
no offset and no fuzz. `prepare()` says so when that stops being true, and the recipe under *When
`prepare()` aborts* rebases it.

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
`docs/community/benchmarks.json` in its tree) is unavailable from the package — upstream's own release
archives leave `docs/community` out too.

### The RAM floors

0.3.2 folded the serve RAM guard into upstream's own `--ram-reserve-mib`: the RAM left free for the rest
of the system (default 2048 MiB), which the expert tiers leave and the guard holds. `0` keeps nothing and
turns the guard off — requests then run however far the RAM goes and the OS reclaims its page cache and
swaps instead. With 62 GiB of RAM and 47.6 GiB of experts resident, that is:

```json
"engine": { "resident-experts": true, "ram-reserve-mib": 0, "resident-budget-gib": 48 }
```

`resident-budget-gib` caps the page-locked copy by hand: with the reserve at 0 nothing else holds the
tiers back, and the cap is the one number that keeps the box livable. It was `"ram-guard-mib": 0` here,
from the local patch this package used to carry; that flag no longer exists, and the server reads the
engine binary's own flag list, so a config key the binary does not have stops the start
(`--ram-guard-mib is not an engine flag`) rather than being ignored.

### Headless: the systemd user service

`/usr/lib/systemd/user/basalt-inference.service` ships with the package; installing it enables
nothing. As your own user — a user unit lives in your own manager, so not with sudo:

```sh
systemctl --user enable --now basalt-inference.service
loginctl enable-linger $USER                       # up at boot, no login needed
journalctl --user -u basalt-inference.service -f   # the server's log; the engine writes its own to
                                                   # ~/.cache/basalt/<hash>/engine.log
```

The unit's only argument is `--config`: model, GPU, port and the engine flags come from
`~/.config/basalt/basalt_config.json`, so one file describes the server either way. It gives the load
15 minutes (`TimeoutStartSec=900` — a default 90 s start would kill a load that was going to work),
restarts on failure, and `stop` sends SIGTERM, which is the server's own shutdown path (it tells the
engine to quit; if the supervisor dies first, the engine's lifeline kills it). Change it with
`systemctl --user edit basalt-inference.service`: a drop-in survives upgrades, the shipped file does
not.

## What the package does

- Binaries → `/usr/lib/basalt/bin/{basalt,basalt-bench,basalt-probe,basalt-vision}`, symlinked into
  `/usr/bin` under qualified names (see Naming). Upstream has no `install()` rules and puts them in
  the source tree's `bin/`.
- `serve/`, `tools/`, `data/` → `/usr/lib/basalt/`, next to `bin/`. `basalt serve` finds that tree at run
  time since 0.3.2 — `platform::install_root()` is the directory above the executable's own — chdirs
  there, runs `python3 -m serve.server`, and the engine reads `data/profiles/*.prof` (0.3.2 refuses to
  start rather than serving a pack whose profile it cannot find). Nothing compiled-in names the path, so
  the layout *is* the configuration: `package()` fails if `serve/server.py`, `data/profiles` or
  `data/bench` is not under `/usr/lib/basalt`.
- Patch 0001 makes the two paths that are still compiled in cmake options: `-DBASALT_ENGINE_BIN=/usr/lib/basalt/bin/basalt`
  and `-DBASALT_INSTALL_ROOT=/usr/lib/basalt`, which feeds `BASALT_BENCH_FIXTURES` /
  `BASALT_BENCH_SOURCE_DIR`. `basalt-probe` and `basalt-bench` otherwise bake in the build tree and
  refuse to run after install (`the engine binary … does not exist`); `package()` greps the installed
  binaries for the installed path and fails the build otherwise. `basalt-bench`'s device-kernel path
  still names `basalt-device`, which upstream builds into the build directory and this package does not
  ship (bench checks it exists and skips the link-rate measurement without it).
- `basalt-inference.service` → `/usr/lib/systemd/user/`, the headless server unit above. The install
  hook only prints how to enable it.
- Python deps come from [extra] (`python-numpy python-jinja python-markupsafe python-regex
  python-yaml python-tqdm python-pillow python-psutil`); `requirements.txt` pins are ignored.
- `cuda` is a runtime dep too (`libcudart/libcublas/libcublasLt`); the driver is left to you.
- `package()` fails the build if the patch is missing from the installed binaries, so an update can never
  silently ship a `basalt-probe` that points at a deleted build tree.

## When `prepare()` aborts

Neither `patch -Np1` nor the `git apply --3way` fallback applied: upstream moved the patch's context.
`prepare()` resets the tracked files to upstream's state first, so reusing `src/` is fine; the `.rej`
file it leaves names the hunk that moved. The patch touches one file and three places in it:

| where | what |
| --- | --- |
| the `option(BUILD_TESTING …)` / `option(WERROR …)` block | the two `set(… CACHE …)` variables |
| `target_compile_definitions(basalt-bench PRIVATE …)` | engine, fixtures, source dir |
| `target_compile_definitions(basalt-probe PRIVATE …)` | engine, fixtures |

```sh
# set these two to your paths: your basalt checkout, and this package directory
CHECKOUT=~/src/basalt
PKGDIR=~/pkg/basalt-inference-git
PATCH=0001-cmake-installed-runtime-tree.patch

git clone --no-hardlinks "$CHECKOUT" /tmp/rebase && cd /tmp/rebase
git fetch origin main && git checkout -q origin/main
git am --3way "$PKGDIR/$PATCH"
#    resolve the conflict where the three places above are (read `git status`, then the file)
git add -A && git am --continue
git format-patch -1 --stdout > "$PKGDIR/$PATCH"
sha256sum "$PKGDIR/$PATCH"                            # put this in sha256sums[], and in .SRCINFO
cd "$PKGDIR" && rm -rf src pkg && makepkg -si
```

What the patch has to keep doing, whatever the file looks like around it: `BASALT_ENGINE_BIN` names the
engine `basalt-bench` and `basalt-probe` start, and `BASALT_INSTALL_ROOT` names the installed tree for
their fixtures — both default to what a plain build uses today, so the patch changes nothing upstream.
Check the result before committing:

```sh
cmake -S . -B /tmp/cfg -G Ninja -DCMAKE_CUDA_ARCHITECTURES=120 -DBUILD_TESTING=OFF \
      -DBASALT_INSTALL_ROOT=/usr/lib/basalt -DBASALT_ENGINE_BIN=/usr/lib/basalt/bin/basalt \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
rg -o '\-DBASALT_BENCH_[A-Z]+=\S+' /tmp/cfg/compile_commands.json    # every path /usr/lib/basalt
```

Upstream changes that need no patch work, only a config one: `BASALT_SOURCE_DIR` (the compiled-in runtime
tree) is gone since 0.3.2 in favour of `install_root()`, and the RAM guard's floor is
`--ram-reserve-mib` — both are in *The RAM floors* and *What the package does* above.
