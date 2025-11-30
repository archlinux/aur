# Maintainer: kpnicz@gmail.com
pkgname=update-proton
pkgver=1.0
pkgrel=1
pkgdesc="Automatically download and install/update proton-cachyos from the CachyOS repo using update-proton"
url="https://packages.cachyos.org"
arch=('any')
license=('MIT')
depends=('curl' 'pacman')
source=("proton-update.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/proton-update.sh" "${pkgdir}/usr/bin/update-proton"
}

