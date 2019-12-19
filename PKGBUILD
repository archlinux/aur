# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname=wps-office-fonts
pkgver=1.0
pkgrel=1
pkgdesc="The wps-office-fonts package contains Founder Chinese fonts"
arch=(any)
url="http://wps-community.org/"
license=(custom)
depends=('fontconfig' 'xorg-font-utils')
#source=("http://kdl.cc.ksosoft.com/wps-community/download/fonts/${pkgname}_${pkgver}_all.deb")
source=("https://github.com/Universebenzene/wps-office-fonts/archive/v${pkgver}.tar.gz")
sha256sums=('db01fc07324115b181cb06f50dfe09fd17feee132c46423ee70b260830211224')

package() {
    install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" "${pkgname}-${pkgver}"/*.TTF
}
