# Maintainer: kpnicz@gmail.com
pkgname=proton-cachyos-launcher
pkgver=1.0
pkgrel=1
pkgdesc="Launch any game with /usr/bin/proton-cachyos Proton-GE style"
arch=('any')
license=('MIT')
depends=(proton-cachyos)
source=("proton-cachyos.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/proton-cachyos.sh" "${pkgdir}/usr/bin/proton-cachyos"
}

