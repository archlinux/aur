# Maintainer: You <you@example.com>
pkgname=donkeytype
pkgver=0.1.0
pkgrel=1
pkgdesc="DonkeyType — simple terminal typing game"
arch=('any')
url="https://example.com/donkeytype"
license=('MIT')
depends=('python')
source=("donkeytype-${pkgver}.tar.gz")
sha256sums=('2d84f24c73f7b8997c42f0cd453a8501ff56173520a29fffdabec247ce36eeae')

build() {
  :
}

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  # copy all files into /usr/share/donkeytype
  cp -r "$srcdir"/* "$pkgdir/usr/share/$pkgname/"
  # make main script executable and install wrapper to /usr/bin
  install -m755 "$pkgdir/usr/share/$pkgname/game.py" "$pkgdir/usr/bin/$pkgname"
}
