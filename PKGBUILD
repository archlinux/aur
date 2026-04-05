# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=1.3
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('97f776cdfc906d0536130d41e87f10f2f1e8ea4d59e06d5a76319bee9e8131c9')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
