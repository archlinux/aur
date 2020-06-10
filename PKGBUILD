# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=leander
pkgbase=$_name-font
pkgname=(ttf-$_name)
pkgver=1.0
pkgrel=1
pkgdesc='A serif font face from Tension Type with a distressed, eroded look'
arch=('any')
url="https://www.fontsquirrel.com/fonts/$_name"
license=('custom:Tension Type Font License')
source=("$_name-$pkgver.zip::https://www.fontsquirrel.com/fonts/download/$_name")
sha256sums=('b3df2ed01eb9c407ec3da8f08fb6f108298cfb242f966415a024dde28f13be34')

package_ttf-leander() {
    provides=("$pkgbase")
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" *License.txt
}
