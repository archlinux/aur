# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.4.1
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('dc330d2c79b2d6b0a8a072a8f4c41099c4c48afa85be0779e722e1cbb29bf1de')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
