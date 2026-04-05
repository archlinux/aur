# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.2
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('caa5db8e13463fc539f1e4e1a7980f452a28d09f0618b1747fedbfc941f4ceed')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
