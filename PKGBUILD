# Maintainer: otaj

pkgname=plymouth-theme-hexagon-alt-gruvbox
pkgver=0.0.3
pkgrel=1
pkgdesc="Gruvbox recolorization of one of the hexagon plymouth themes"
arch=('any')
url="https://github.com/otaj/plymouth-theme-hexagon-alt-gruvbox"
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/${pkgver}.zip")
sha256sums=('7647217e229cf5e965f84da24a097dc71fba6ffc3932a6f05bcda0bd8eb13955')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/hexagon-alt-gruvbox"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/hexagon-alt-gruvbox"
    find . -type f -exec install -Dm644 "{}" "${pkgdir}"/usr/share/plymouth/themes/hexagon-alt-gruvbox/ \;
}
