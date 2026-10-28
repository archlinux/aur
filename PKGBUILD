# Maintainer: otaj

pkgname=plymouth-theme-hexagon-alt-gruvbox
pkgver=0.0.4
pkgrel=1
pkgdesc="Gruvbox recolorization of one of the hexagon plymouth themes"
arch=('any')
url="https://github.com/otaj/plymouth-theme-hexagon-alt-gruvbox"
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.zip")
sha256sums=('1c04d9590ae005162d8e40d99233e3a5a3baf5c75aeee2a84638718ba66b99b9')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/hexagon-alt-gruvbox"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/hexagon-alt-gruvbox"
    find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/share/plymouth/themes/hexagon-alt-gruvbox/ \;
}
