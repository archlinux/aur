# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=chili-sddm-theme
pkgver=0.1.5
pkgrel=1
pkgdesc='Chili theme for SDDM'
arch=('i686' 'x86_64')
url="https://github.com/MarianArlt/sddm-chili"
license=('GPL3')
depends=(qt5-graphicaleffects qt5-quickcontrols sddm)
install="$pkgname.install"
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a3c0607bf70f448fff0a271624e3bc15af978894c04c98355d00a57431e49a0f')

package() {
    mkdir -p "${pkgdir}/usr/share/sddm/themes"
    cp -r "${srcdir}/sddm-chili-${pkgver}" "${pkgdir}/usr/share/sddm/themes/chili"
}
