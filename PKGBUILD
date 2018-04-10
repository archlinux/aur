# Maintainer: Simon Legner <Simon.Legner@gmail.com
pkgname=solo
pkgver=1.7
pkgrel=1
pkgdesc="Prevents multiple cron instances from running simultaneously"
arch=('any')
url="http://timkay.com/solo/"
license=('GPL')
depends=('perl')
source=(http://timkay.com/$pkgname/$pkgname)

package() {
  cd "$srcdir"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
sha1sums=('4b4b9a3fadf3bd5cd390ca993ffbc6955ff67f80')
sha256sums=('08b5224d928277735c737cd5af24a29a50fd231102ca0336cfc96f3cb86ccc93')
