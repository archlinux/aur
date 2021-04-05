# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=frb-american-cursive
_upstream=FRBAmericanCursive
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=1.002.1
pkgrel=1
pkgdesc='a cursive “textbook hand” font family with 50+ faces useful for education'
arch=('any')
url="https://github.com/ctrlcctrlv/$_upstream"
license=('GPL3')
_pkgver=$(sed 's/\.0\+/./' <<< "$pkgver")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$_pkgver/$_upstream.zip")
sha256sums=('139b9797886112ea5e89171a9638787fde8833e85eddb9ae941b2fdad56b0e19')

package_otf-frb-american-cursive() {
    provides=("$pkgbase")
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" dist/*.otf
}
