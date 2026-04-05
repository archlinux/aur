# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=0.5
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('02d491e07a36f32705b1f282d1df174f589fc0eb77ed9066b3b7a94dfac677c3')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
