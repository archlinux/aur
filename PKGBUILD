# Maintainer: Maneren <maneren731@gmail.com>

name=file-share
pkgname=$name-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="Rust powered HTTP file-server with beautiful web-based GUI."
url="https://github.com/Maneren/${name}-rs"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=()
optdepends=("xdg-desktop-portal: for GUI picker support")
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}.x86_64.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8eec627ee480d5f46d37df13dd814ae74af76c760bc379ca0dcca1210cc35789')
source_aarch64=("${pkgname}-${pkgver}.aarch64.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('a9fcf844e8b7856d899558e23b5b1bd4cf3ccf7c98af9f139210514df5d37fd2')

package() {
  mkdir -p "$pkgdir/usr/bin"
  chmod +x "$srcdir/$name"
  mv "$srcdir/$name" "$pkgdir/usr/bin/$name"
}
