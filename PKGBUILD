# Maintainer: jdigi78 <jdigiovanni78@gmail.com>

pkgname=pacdate
pkgver=1.1.0
pkgrel=2
pkgdesc='Automates downgrading packages to a specific date'
arch=('any')
url="https://github.com/Joseph-DiGiovanni/pacdate"
license=('GPL3')
depends=('pacman')
source=("https://github.com/Joseph-DiGiovanni/pacdate/archive/refs/tags/v${pkgver}.tar.gz")
        
sha256sums=('9c722f87fd6baa249e084923eda969159f40ff5ef0f5402f79b27da1167909f1')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/pacdate.sh" "${pkgdir}/usr/bin/pacdate"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
