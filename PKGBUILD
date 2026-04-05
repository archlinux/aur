# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('a5f7f903eb7b54c804ae9fa6d6f63dc462b706fd8bcfbd850fcd01f03c7545da')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
