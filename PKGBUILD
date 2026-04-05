# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=1.2
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('f941c147267326ea345d5b487f98e9805fee516181d19f1b84e5e4fc58f2dcf4')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
