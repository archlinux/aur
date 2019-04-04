# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=syntax
pkgver=2.8.4
pkgrel=1
pkgdesc="Jameica Plugin for financial accounting according to SKR03/04"
depends=("jameica")
url="http://willuhn.de/products/syntax/"
arch=('any')
license=('GPL2')
source=("https://www.willuhn.de/products/syntax/releases/2.8/syntax-${pkgver}.zip"
"https://www.willuhn.de/products/syntax/releases/2.8/syntax-${pkgver}.zip.asc")
validpgpkeys=("7314FBDE7D38EE5610D291B65A8ED9CFC0DB6C70") # Olaf Willuhn <info@willuhn.de>
md5sums=('e1212f030b80caeb66623c374b3f4128'
         'SKIP')
 
package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}
