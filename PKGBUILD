# Maintainer: Jan Holthuis <jan[dot]holthuis[at]ruhr-uni-bochum[dot]de>
pkgname=c1_displaytool
pkgver=0.1
pkgrel=1
pkgdesc="A small helper script to change the framebuffer mode on an ODROID-C1."
url="https://gist.github.com/Holzhaus/9d328e2f4ad31357f025"
arch=('any')
license=('BSD')
depends=('bash') 
source=("https://gist.githubusercontent.com/Holzhaus/9d328e2f4ad31357f025/raw/222904ad8b000639ce69eda137c5b875ac70d238/c1_displaytool.sh")
sha256sums=('5821e1baed41399ac543632117b1cde528da63c578218754d03d5dd6c167a615')

package() {
  install -Dm755 "$srcdir/c1_displaytool.sh" "$pkgdir/usr/bin/c1_displaytool"
}

# vim:set ts=2 sw=2 et:
