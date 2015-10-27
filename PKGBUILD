# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=syntax
pkgver=2.6
pkgrel=1
pkgdesc="Jameica Plugin for financial accounting according to SKR03/04"
depends=("jameica")
url="http://willuhn.de/products/syntax/"
arch=('any')
license=('GPL2')
source=("http://willuhn.de/products/syntax/releases/current/syntax.zip")
md5sums=('6de7bc56e24ac29b85ce705cc6faf8ef')
 
package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}
