# Maintainer: Maneren <maneren731@gmail.com>

name=file-share
pkgname=$name-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Rust powered HTTP file-server with beautiful web-based GUI."
url="https://github.com/Maneren/${name}-rs"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=()
optdepends=("xdg-desktop-portal: for GUI picker support")
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('1f8b0fce0b98ff1cbc173179beef2e24b7e0cc0896f738fee82f303d6c1d470e')
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('88210d9cc53f69a9cbd39c6b4d5873ba745f92cbd11c834532a378a8ea94af1a')

package() {
  mkdir -p "$pkgdir/usr/bin"
  chmod +x "$srcdir/$name"
  mv "$srcdir/$name" "$pkgdir/usr/bin/$name"
}
