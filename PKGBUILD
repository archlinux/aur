# Maintainer: Maneren <maneren731@gmail.com>

name=file-share
pkgname=$name-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Rust powered HTTP file-server with beautiful web-based GUI."
url="https://github.com/Maneren/${name}-rs"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=()
optdepends=("xdg-desktop-portal: for GUI picker support")
provides=("$pkgname")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('80e65bc22af89e94c32deed9e7bf67ecfbd074d7222084cc2d68261a92e7ef8a')
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/Maneren/${name}-rs/releases/download/v${pkgver}/${name}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('6f153fbdc341a53e0423eb5b286af4c2ae6cbaaee935136a16b3942af1c261d2')

package() {
  mkdir -p "$pkgdir/usr/bin"
  chmod +x "$srcdir/$name"
  mv "$srcdir/$name" "$pkgdir/usr/bin/$name"
}
