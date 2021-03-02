# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=frb-american-cursive
_upstream=FRBAmericanCursive
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=1.001
pkgrel=1
pkgdesc='a cursive “textbook hand” font family with 50+ faces useful for education'
arch=('any')
url="https://github.com/ctrlcctrlv/$_upstream"
license=('GPL3')
_pkgver=$(printf $pkgver | sed -e 's/\.0\+/./')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$_pkgver/$_upstream.zip")
sha256sums=('fd4d3bcd6b91dc83101e5f37e5b0366605c7ddb49972a2bc01b5eb6205db7a43')

package_otf-frb-american-cursive() {
    provides=("$pkgbase")
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" dist/*.otf
}
