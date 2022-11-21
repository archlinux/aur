# Maintainer: hu3rror <hu3rror@protonmail.com>

pkgname=sddm-swish
pkgver=0.2
pkgrel=2
pkgdesc="A modified login theme for SDDM Display Manager from Eliver Lara."
arch=('any')
url="https://github.com/icaho/Swish"
license=('GPL3')
depends=('qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg' 'sddm' 'plasma-framework' 'plasma-workspace')
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0f7493e6c9d9f0f0c0e96b63053d8d9dfc22b6ca113de86a8be142642fab1df3')

package() {
    mkdir -p "${pkgdir}/usr/share/sddm/themes"
    cp -r "${srcdir}/Swish-${pkgver}" "${pkgdir}/usr/share/sddm/themes/Swish"
}

