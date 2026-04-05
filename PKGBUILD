# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.9
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('aa1094f7f18726d465914991079fdaec75986db49e3e37ac57c56becc4d11e31')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
