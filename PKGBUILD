# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.4
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('b99d777859650711e506ee1576553de565b01a8364269937c6818fcadf4a6f3c')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
