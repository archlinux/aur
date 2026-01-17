# Maintainer: otaj

pkgname=plymouth-theme-hexagon-alt-gruvbox
pkgver=0.0.2
pkgrel=1
pkgdesc="Gruvbox recolorization of one of the hexagon plymouth themes"
arch=('any')
url="https://github.com/otaj/plymouth-theme-hexagon-alt-gruvbox"
license=('GPL')
depends=('plymouth')

source=("${url}/archive/refs/tags/${pkgver}.zip")
sha256sums=('ed0d5974aa37e10b80226a4fffae283a9f1ed1c45bbb88b5ac5de1903e5e2a19')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/hexagon-alt-gruvbox"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/hexagon-alt-gruvbox"
    find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/share/plymouth/themes/hexagon-alt-gruvbox/ \;
}

