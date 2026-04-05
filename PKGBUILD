# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.1
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('9cf715f53a716350dfea4938e0ca697fc2d5331231853df57137a0b4a244dcef')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
