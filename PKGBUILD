# Maintainer: jdigi78 <jdigiovanni78@gmail.com>

pkgname=pacdate
pkgver=1.0.0
pkgrel=1
pkgdesc='Automates downgrading packages to a specific date'
arch=('any')
license=('none')
depends=('pacman')
source=("pacdate.sh")
        
sha256sums=('SKIP')

package() {
    install -Dm755 "pacdate.sh" "${pkgdir}/usr/bin/pacdate"
}
