# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.8.1
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('ad0be7d66e7f290df30d2d9db89c033d67d275079d9c085a3f10455edc98cc75')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
