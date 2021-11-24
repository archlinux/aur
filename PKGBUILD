# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=leander
pkgbase=$_name-font
pkgname=(ttf-$_name)
pkgver=1.000
pkgrel=2
pkgdesc='A serif font face from Tension Type with a distressed, eroded look'
arch=(any)
url="https://www.fontsquirrel.com/fonts/$_name"
license=('custom:Tension Type Font License')
source=("$_name-$pkgver-$pkgrel.zip::https://www.fontsquirrel.com/fonts/download/$_name")
sha256sums=('e7ab6ecdeb2f680c1419a39ea32fb671cd907309f9e45f1cac5b98917b0fa152')

package_ttf-leander() {
    provides=("$pkgbase")
    install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" *License.txt
}
