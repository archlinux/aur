pkgname=dcr-bin
pkgver=0.7.1
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
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1/dcr-x86_64-unknown-linux-musl-0.7.1")
sha256sums_x86_64=('6596244b757aff828e8eab4751134b92728a3111d25b501b4372fe363c12e2ef')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1/dcr-aarch64-unknown-linux-musl-0.7.1")
sha256sums_aarch64=('aa3af33364548570940058a6f30a28f117e5b22b5c099ffb4c3605c1c5ca559e')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1/dcr-i686-unknown-linux-musl-0.7.1")
sha256sums_i686=('7f6d15d3920cf6d48caaa79a9f3aff9ec670e3d07442728e65d1f56d2c7be7a0')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1/dcr-armv7-unknown-linux-musleabihf-0.7.1")
sha256sums_armv7h=('b80dcffad203a3c7e48b2689275ed000b401635d5448de6e2eb6fcc3ef0a5bec')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1/dcr-riscv64gc-unknown-linux-musl-0.7.1")
sha256sums_riscv64=('9c86c45af54cfe691cbda85e176ac052fc76da637902b284b097668176396f79')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
