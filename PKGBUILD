pkgname=dcr-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Cargo-like utility to manage C/C++ projects (pre-compiled musl binary)"
arch=('x86_64' 'aarch64' 'i686' 'armv7h' 'riscv64')
url="https://github.com/dexoron/dcr"
license=('GPL-3.0-or-later')
provides=('dcr')
conflicts=('dcr')
optdepends=(
  'gcc: build C/C++ projects with GCC'
  'clang: build C/C++ projects with Clang'
)
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.0/dcr-x86_64-unknown-linux-musl-0.8.0")
sha256sums_x86_64=('b594dcf2f3451f2183fac5fa0dbb67a8175d138574ab88b6666f52128d05a16b')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.0/dcr-aarch64-unknown-linux-musl-0.8.0")
sha256sums_aarch64=('29f2898440ebc9abf8a1477ec3ac07ac48b8edddfdfbb2f2a1fc0d6a47dff5b0')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.0/dcr-i686-unknown-linux-musl-0.8.0")
sha256sums_i686=('3daa3ec9ddd4cc8bc7e6816384d236c352a2e8e5c757cd917cfa7ce1acbd09a8')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.0/dcr-armv7-unknown-linux-musleabihf-0.8.0")
sha256sums_armv7h=('b63006e2e66718669d8f2f9945524b90c547d63e7ef187e6071cb4b56db0acf6')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.0/dcr-riscv64gc-unknown-linux-musl-0.8.0")
sha256sums_riscv64=('73b653c7ed3d6d3ab71f0ee56416bd720bda4da76c34cc37fb7001b2321de0ed')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
