# Maintainer: Meow-2 <orzkey@outlook.com>

pkgname=sddm-swish-zh
pkgver=1.0
pkgrel=1
pkgdesc="A login theme for SDDM Display Manager."
arch=('any')
url="https://github.com/Meow-2/Swish"
license=('GPL3')
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg' 'sddm' 'plasma-framework5')
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('c42620c36097b1c28345eae982184e00')

package() {
    mkdir -p "${pkgdir}/usr/share/sddm/themes"
    cp -r "${srcdir}/Swish-${pkgver}" "${pkgdir}/usr/share/sddm/themes/Swish-${pkgver}/"
}
