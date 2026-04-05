# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('68ea4f1945e775e6b7ffe6ee10bf7750ca8825f758fc7d376a8c2b0ac020c7d6')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
