# Maintainer: Magnus Anderssen <magnus@magooweb.com>

_name=outfit
pkgbase=$_name-font
#pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgname=(otf-$_name ttf-$_name)
pkgver=1.1
pkgrel=1
pkgdesc='A beautiful geometric sans: The official typeface for brand automation company outfit.io.'
arch=('any')
url="https://github.com/Outfitio/Outfit-Fonts"
license=('OFL')
source=(
    "${url}/archive/refs/tags/${pkgver}.zip"
)
sha256sums=('31b95566b43805970a62a12aeb3d90a38e06c4d63e288dd8ebef63985ce5a5b7')

package_otf-outfit() {
    provides=("$pkgbase")
    mkdir -p "${pkgdir}/usr/share/fonts/$pkgbase/"
    cd "$srcdir"
    install -Dm0644 Outfit-Fonts-${pkgver}/fonts/otf/* "$pkgdir/usr/share/fonts/$pkgbase"
    install -Dm0644 Outfit-Fonts-${pkgver}/OFL.txt  "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-outfit() {
    provides=("$pkgbase")
    mkdir -p "${pkgdir}/usr/share/fonts/$pkgbase/"
    cd "$srcdir"
    install -Dm0644 Outfit-Fonts-${pkgver}/fonts/ttf/* "$pkgdir/usr/share/fonts/$pkgbase"
    install -Dm0644 Outfit-Fonts-${pkgver}/OFL.txt  "$pkgdir/usr/share/licenses/$pkgname"
}

# package_ttf-outfit-variable() {
#     provides=("$pkgbase-variable")
#     mkdir -p "${pkgdir}/usr/share/fonts/$pkgbase/"
#     cd "$srcdir"
#     install -Dm0644 Outfit-Fonts-${pkgver}/fonts/variable/* "$pkgdir/usr/share/fonts/$pkgname"
#     install -Dm0644 Outfit-Fonts-${pkgver}/OFL.txt  "$pkgdir/usr/share/licenses/$pkgname"
# }