# Maintainer: haadisaqib
pkgname=automouse
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple mouse jiggler to show activity of microsft teams"
arch=('any')
url="https://github.com/haadisaqib/automouse"
license=('GPL')
depends=('xdotool')
source=("https://raw.githubusercontent.com/haadisaqib/automouse/main/automouse")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/automouse" "${pkgdir}/usr/bin/automouse"
}
