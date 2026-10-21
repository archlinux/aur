# nvbandwidth (AUR)

Packaging for [NVIDIA/nvbandwidth](https://github.com/NVIDIA/nvbandwidth), a tool
that measures copy bandwidth on NVIDIA GPUs, including device-to-device P2P
transfers.

This exists because NVIDIA removed the `p2pBandwidthLatencyTest` sample from
cuda-samples in the CUDA 13.4 update, and pointed users to nvbandwidth instead:

```
### CUDA 13.4
* Removed obsolete samples ... p2pBandwidthLatencyTest.
```

The AUR has no package for this tool as of 2026-10-20. Searches for
`nvbandwidth`, `nvbandwidth-git`, `nvband`, and `cuda-samples` all return zero
results.

## Layout

| Path | Purpose |
| --- | --- |
| `PKGBUILD` | Arch package definition, builds tag v0.10.0 |
| `.SRCINFO` | AUR metadata, regenerate with `makepkg --printsrcinfo > .SRCINFO` |
| `pkg/`, `src/` | makepkg work dirs, gitignored |

## Environment variables

Every name below comes from CMake or from makepkg. The package defines no
variable names of its own. Two defaults are set in the PKGBUILD, and both are
marked in the table.

`makepkg -si` works with no overrides on a stock Arch box: `nvidia-utils`
provides the driver libraries in `/usr/lib`, and upstream detects the GPU
architecture.

### Build time

| Variable | Read by | Default | Purpose |
| --- | --- | --- | --- |
| `CUDACXX` | CMake | `/opt/cuda/bin/nvcc`, set by the PKGBUILD | `nvcc` may not be in `PATH` on Arch, since the `cuda` package installs to `/opt/cuda`. |
| `CUDAHOSTCXX` | CMake | unset | Host compiler for nvcc. Set it when the system `gcc` is newer than your nvcc release accepts. |
| `CUDAARCHS` | CMake, forwarded by the PKGBUILD | unset | Target GPU architectures. One value such as `86`, or a quoted semicolon separated list such as `'86;89'`, since an unquoted semicolon ends the shell command. CMake also accepts the special values `native`, `all-major`, and `all`. See the note below. |
| `CUDAFLAGS` | CMake | unset | Extra nvcc flags, for example `-allow-unsupported-compiler`. |
| `LDFLAGS` | CMake and makepkg | unset | Extra linker flags. Use it to add `-L` for a driver userspace that is outside `/usr/lib`. |
| `PATH` | shell | inherited | The upstream README asks for `nvcc` in `PATH`. Setting `CUDACXX` makes that unnecessary. |
| `PKGDEST` | makepkg | makepkg default | Where the built `.pkg.tar.zst` lands. |

### Runtime

| Variable | Read by | Default | Purpose |
| --- | --- | --- | --- |
| `LD_LIBRARY_PATH` | dynamic loader | unset | The binary loads `libcuda.so.1` and `libnvidia-ml.so.1`. These resolve through the ldconfig cache when the driver comes from the package manager. Set this only for a driver installed elsewhere. |

`LD_LIBRARY_PATH` takes precedence over the ldconfig cache, which is useful for
testing a second copy of the driver library:

```bash
mkdir -p /tmp/nv-stock
cp /path/to/libcuda.so.1 /tmp/nv-stock/libcuda.so.1
LD_LIBRARY_PATH=/tmp/nv-stock nvbandwidth -l
```

## CUDAARCHS needs forwarding

Upstream unsets the value that CMake initialises from `CUDAARCHS`, so the
PKGBUILD forwards it as a cache variable instead:

```
[[ -n "${CUDAARCHS:-}" ]] && _cmake_args+=(-DCMAKE_CUDA_ARCHITECTURES="$CUDAARCHS")
```

With no value, upstream detects the architecture from the GPU, then from nvcc.

## When you need an extra -L

The binary links `libcuda` and `libnvidia-ml`, which `nvidia-utils` provides in
`/usr/lib`. For driver userspace in another prefix, add it through `LDFLAGS`,
which CMake passes to the linker:

```bash
LDFLAGS=-L/path/to/driver/lib
```

Use a clean build dir after such a change, since CMake caches the flags.

## Build

With makepkg:

```bash
makepkg -si
```

The variables in the build time table go in front of makepkg, or into
`makepkg.conf`:

```bash
env CUDAARCHS='86' LDFLAGS=-L/path/to/driver/lib makepkg -si
```

makepkg also accepts a variable as an argument:

```bash
makepkg CUDAARCHS=86 -si
```

## Documentation

Upstream documents the tool, so this README does not repeat it:

- [README.md](https://github.com/NVIDIA/nvbandwidth/blob/v0.10.0/README.md),
  for testcase names and command line flags
- [troubleshooting.md](https://github.com/NVIDIA/nvbandwidth/blob/v0.10.0/troubleshooting.md),
  for known issues

The upstream README is also installed at `/usr/share/doc/nvbandwidth/README.md`.

## Packaging notes

- `depends=('cuda')` follows the AUR convention for CUDA tools such as
  `cuda_memtest`. Note that `extra/cuda` also pulls `opencl-nvidia`. The driver
  itself is not declared, because it is not always installed by pacman.
- `makedepends=('cmake')` alone is enough, since `cuda` is in `depends`.
- Upstream defines no CMake `install()` rule, so `package()` installs the binary
  by hand, as `clpeak-git` does.
- Upstream takes its version string from `git describe`, so a tarball build
  prints an empty version. Cosmetic only.
- Configure needs network access, since upstream pulls argparse v3.2 with
  `FetchContent_Declare`. A build in a network-isolated chroot fails here.
- The PKGBUILD passes `-Wno-author`, which silences an upstream CMake policy
  warning about `DOWNLOAD_EXTRACT_TIMESTAMP`. CMake 3.27 or newer accepts that
  flag; older releases accept the alias `-Wno-dev`.
