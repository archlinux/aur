# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.8
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('f8c09df39fb9360b7024c3110ae516de3599c8389c4e69e27300f3bffeea3e08')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
