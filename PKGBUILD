# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=solo
pkgver=1.7
pkgrel=2
pkgdesc="Prevents multiple cron instances from running simultaneously"
arch=('any')
url="https://timkay.com/solo/"
license=('GPL')
depends=('perl')
source=(https://timkay.com/$pkgname/$pkgname)

package() {
  cd "$srcdir"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('08b5224d928277735c737cd5af24a29a50fd231102ca0336cfc96f3cb86ccc93')
