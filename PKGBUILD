# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=1.4
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('4716ceaff229798de5e00d7060169e3ff77119a5fa21accece5986d2100f2dfd')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
