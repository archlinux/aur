# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.7
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('be5cccc435dff5b04b9741fbf6f11e324306fb27ce3dcb3c1b80ecc7c2a292d1')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
