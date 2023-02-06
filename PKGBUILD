pkgname=syntax
pkgver=2.10.4
_pkgver=2.10
pkgrel=1
pkgdesc="Jameica Plugin for financial accounting according to SKR03/04"
depends=("jameica")
url="http://willuhn.de/products/syntax/"
arch=('any')
license=('GPL2')
source=("https://www.willuhn.de/products/syntax/releases/$_pkgver/syntax-${pkgver}.zip"
"https://www.willuhn.de/products/syntax/releases/$_pkgver/syntax-${pkgver}.zip.asc")
validpgpkeys=("7314FBDE7D38EE5610D291B65A8ED9CFC0DB6C70") # Olaf Willuhn <info@willuhn.de>
md5sums=('8531885d83a1bdcb1da627c75a4b8479'
         'SKIP')
 
package() {
    mkdir -p "$pkgdir/opt/jameica/plugins"
    cp -r "$srcdir/$pkgname" "$pkgdir/opt/jameica/plugins"
}
