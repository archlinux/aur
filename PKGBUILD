# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=emberly
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name otf-$_name-variable ttf-$_name-variable)
pkgver=1.3
pkgrel=1
pkgdesc='A display font inspired by the Didone style created by Rajesh Rajput'
arch=('any')
url="https://www.behance.net/gallery/87667103/Emberly-Free-Typeface-54-Styles"
license=('OFL')
# Download is $0 purchase but requires email: https://gumroad.com/l/XTAeN
source=("file://${_name^} v$pkgver.zip")
sha256sums=('e8494cdafd3fd306a4965617413e628e1ae42c884c0c37006f1bdd411530669f')

package_otf-emberly() {
    provides=("$pkgbase")
    cd "${_name^} v$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" OTF/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

package_ttf-emberly() {
    provides=("$pkgbase")
    cd "${_name^} v$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" TTF/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

package_otf-emberly-variable() {
    provides=("$pkgbase-variable")
    cd "${_name^} v$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" Variables/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

package_ttf-emberly-variable() {
    provides=("$pkgbase-variable")
    cd "${_name^} v$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" Variables/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
