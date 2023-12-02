# Maintainer: jdigi78 <jdigiovanni78@gmail.com>

pkgname=pacdate
pkgver=1.1.0
pkgrel=1
pkgdesc='Automates downgrading packages to a specific date'
arch=('any')
license=('GPL3')
depends=('pacman')
source=("https://github.com/Joseph-DiGiovanni/pacdate/archive/refs/tags/v${pkgver}.tar.gz")
        
sha256sums=('b6e353a53b5104e669c87fa8ccc6324d5abfbf8819c2453d3d00152a515c257d')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pacdate.sh" "${pkgdir}/usr/bin/pacdate"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
