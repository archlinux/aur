pkgname=dcr-bin
pkgver=0.9.0
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
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.0/dcr-x86_64-unknown-linux-musl-0.9.0")
sha256sums_x86_64=('1d782cbfcc7c0a0c1d996545fe073dbfa3df5cd7705627347b9698c1a9da98e3')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.0/dcr-aarch64-unknown-linux-musl-0.9.0")
sha256sums_aarch64=('33c49c05b262c11d4baa0688e43343d34f295485f9af223dda410d0f1a05c352')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.0/dcr-i686-unknown-linux-musl-0.9.0")
sha256sums_i686=('182e04ac36da79e3430bf376c7ea9828756b08f43abb46b1e1957824a21b6cb7')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.0/dcr-armv7-unknown-linux-musleabihf-0.9.0")
sha256sums_armv7h=('7c90369e93b74e14ce0ffe63576ba94c6d5caccbb6b3fe52a1c07e6b052003ae')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.0/dcr-riscv64gc-unknown-linux-musl-0.9.0")
sha256sums_riscv64=('9cc8d23807de4d688c601b0eb1408a13ceb694b0c86f77482d9ad73e90924500')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
