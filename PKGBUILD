# Maintainer: huyz
# Maintainer: szxzip <szxzip AT gmail DOT com>
pkgname=ttf-fonts-gb-deepin
pkgver=1.5
pkgrel=1
pkgdesc="GB18030 fonts from deepin"
arch=('any')
url="https://www.deepin.org"
license=('custom')
depends=('fontconfig')
source=(
    "https://community-packages.deepin.com/deepin/beige/pool/main/f/fonts-gb/fonts-gb_${pkgver}.orig.tar.xz"
)
sha256sums=('260366c6d0dbfac4f5d90635605006fb0acf482a89c08f86509b70ccb89e0327')

package() {
    install -d "$pkgdir/usr/share/fonts/TTF/fonts-gb-deepin"
    install -m644 "$srcdir/fonts-gb-${pkgver}"/*.ttf \
        "$pkgdir/usr/share/fonts/TTF/fonts-gb-deepin/"
}
