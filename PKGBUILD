# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('2ed63507b1608601731098f6169874a6f16c334a75d66a477daf34e94c17af46')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
