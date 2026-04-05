# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=1.4.1
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('34a99d435e743b51c288c53e788d933178bba6a119bebbcfc1671969da3f72b1')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
