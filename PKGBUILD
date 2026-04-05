# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('bdfae85e4e456fe6dbdb450d085d76f7f310abbb75fd6472f3b7608d78471442')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
