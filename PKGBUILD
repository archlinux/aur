# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.6
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('e6ec491c8e7b7544a2c0df62ae376b0716675cd0e845d9d128babb3c1f997e22')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
