# This is an AUR PKGBUILD for spxc
pkgname=spxc
pkgver=1.0
pkgrel=1
pkgdesc="A simple CLI tool that shows version and help"
arch=('any')
url="https://aur.archlinux.org/packages/spxc"
license=('MIT')
depends=('bash')
source=("spxc")
sha256sums=('752c56c14fc0e94862f07b151c6a23678d65bf147b4e9f7b32f1a52b906c9ee0')

package() {
    install -Dm755 "${srcdir}/spxc" "${pkgdir}/usr/bin/spxc"
}
