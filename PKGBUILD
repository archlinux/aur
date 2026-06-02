pkgname=dcr-dev-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Cargo-like utility to manage C/C++ projects (pre-compiled musl binary dev release)"
arch=('x86_64')
url="https://github.com/dexoron/dcr"
license=('GPL-3.0-or-later')
provides=('dcr')
conflicts=('dcr')
optdepends=(
  'gcc: build C/C++ projects with GCC'
  'clang: build C/C++ projects with Clang'
)
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.0-dev/dcr-x86_64-unknown-linux-musl-0.7.0-dev")
sha256sums_x86_64=('c0edb433cace047a7d2a2769296be4e1a1ea8224af44cf3bb3b33a561c6e3e32')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
