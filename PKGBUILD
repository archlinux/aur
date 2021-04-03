# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=frb-american-cursive
_upstream=FRBAmericanCursive
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=1.002
pkgrel=1
pkgdesc='a cursive “textbook hand” font family with 50+ faces useful for education'
arch=('any')
url="https://github.com/ctrlcctrlv/$_upstream"
license=('GPL3')
_pkgver=$(sed 's/\.0\+/./' <<< "$pkgver")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$_pkgver/$_upstream.zip")
sha256sums=('912e3ed812f5c285021a226b8c88b619ed09d7b1a903e3f762a711cf536272b3')

package_otf-frb-american-cursive() {
    provides=("$pkgbase")
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" dist/*.otf
}
