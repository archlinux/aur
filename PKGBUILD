# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=syntax
pkgver=2.8.1
pkgrel=1
pkgdesc="Jameica Plugin for financial accounting according to SKR03/04"
depends=("jameica")
url="http://willuhn.de/products/syntax/"
arch=('any')
license=('GPL2')
source=("$pkgname-$pkgver.zip::http://willuhn.de/products/syntax/releases/current/syntax.zip")
md5sums=('77e2ceb79dd058a83581fc76c7fbd3b0')
 
package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}
