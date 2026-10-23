# polystrata (AUR)

Arch Linux package for [PolyStrata](https://github.com/VecSzn/PolyStrata) —
run large AI models on your own PC (Qwen3.8-Flash-Next, GLM 5.3 Flash,
DeepSeek V4 Flash and more) on an NVIDIA or AMD GPU, on an
[llama.cpp](https://github.com/ggml-org/llama.cpp)-based engine.

Packages upstream tag `v0.1.45-poly.2` (pkgver `0.1.45.poly.2`: AUR disallows
hyphens in pkgver).

## Files

```
├── PKGBUILD           the package: source tree -> /opt/polystrata + launchers
├── .SRCINFO            generated: makepkg --printsrcinfo > .SRCINFO
├── polystrata.sh       launcher source (installed as /usr/bin/polystrata
│                       and /usr/bin/polystrata-update)
└── polystrata.install  post-install notes
```

## Why the package looks like this

The upstream release asset is a Windows engine; on Linux, upstream installs by
cloning the repo and running `./setup.sh`, which:

1. creates a private venv (`.venv`) next to the source,
2. compiles the engine for your GPU — CUDA or HIP, 10–40 minutes, once,
3. downloads the model files — tens of GB — into the same folder,
4. starts the server; later runs just start it.

All of that happens without root, in the folder the source lives in. So the
package ships the tagged source tree under `/opt/polystrata` and a launcher
that copies it into `~/PolyStrata` on the first run (and refreshes it when the
package is updated), then runs upstream's own `setup.sh` there. No binary is
built at package time: the engine must be compiled for the specific GPU on the
specific machine, so `arch=('any')` and the build tools are runtime deps.

## Usage

```
polystrata            set up if needed, then start the model
polystrata --help     upstream setup options (--family, --model, --context, ...)
polystrata-update     rebuild the engine and refresh the Python packages
                      without starting the model
```

The app, venv, engine and models live in `~/PolyStrata` (override the
location with the `POLYSTRATA_HOME` environment variable). A folder that
already exists there but was not created by the package (for example a git
clone) is used as-is and never overwritten.

| Dependency    | Role                                                        |
|---------------|-------------------------------------------------------------|
| `python`      | the venv (3.10+; Arch's python includes pip via ensurepip)  |
| `gcc`         | host compiler for the engine build (CUDA and HIP)           |
| `git`         | engine builds                                               |
| `cuda` (opt)  | NVIDIA engine; upstream builds with CUDA 13.0               |
| `rocm-hip-sdk` (opt) | AMD engine via a system ROCm 7 in /opt/rocm; otherwise ROCm is downloaded into the venv on first start (~10 GB) |

## Known quirks (upstream behavior)

- **"ROCm was installed but its compiler is missing (.)"** on the first start:
  the first `rocm-sdk path --root` call must extract a ~6 GB toolchain into
  the venv; upstream wraps it in a 60-second timeout, swallows the timeout and
  reports a missing compiler. Just run `polystrata` again — the extraction
  makes progress and is one-time; once cached the call is instant.
- The engine compile needs scratch space in `/tmp`; on a small tmpfs a full
  `/tmp` surfaces as "Check for working CXX compiler: /usr/bin/c++ - broken".
- First runs download tens of GB into `~/PolyStrata`.

## Updating the package

1. Bump `_tag`, `pkgver` (hyphens become dots) and `pkgrel` in `PKGBUILD`,
   and the `VERSION` pin reaches `polystrata.sh` automatically via `@@PKGVER@@`
   / `@@PKGREL@@`.
2. Fetch the new source and update `sha256sums`:
   `curl -sL -o- <tarball-url> | sha256sum`.
   Any change to a local file (even a comment) changes its checksum —
   always re-run `makepkg --printsrcinfo` after editing.
3. `makepkg --printsrcinfo > .SRCINFO`, then `makepkg` and install to test.
4. Commit `PKGBUILD`, `.SRCINFO`, `polystrata.sh`, `polystrata.install`,
   `README.md` and push to the AUR (`ssh://aur@aur.archlinux.org/polystrata.git`).
   Never commit `src/`, `pkg/` or `*.pkg.tar.*`.

## License

MIT — the package ships upstream's `LICENSE`, installed to
`/usr/share/licenses/polystrata/`.
