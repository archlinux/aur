# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=1.1
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('94033c0d2137dcf9fbe00ccc2402e72374f2d2cc0c56a97760c4e0235dd6598b')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
