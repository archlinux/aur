# Maintainer: jdigi78 <jdigiovanni78@gmail.com>

pkgname=pacdate
pkgver=1.0.0
pkgrel=2
pkgdesc='Automates downgrading packages to a specific date'
arch=('any')
license=('GPL3')
depends=('pacman')
source=("https://github.com/Joseph-DiGiovanni/pacdate/archive/refs/tags/v1.0.0.tar.gz")
        
sha256sums=('0c401b6bb6cc09f2334edfa554ded1449f8ef32691f6f642f75aa2754fc9e775')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pacdate.sh" "${pkgdir}/usr/bin/pacdate"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
