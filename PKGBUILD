# Maintainer: Veillain <veillainwertz@gmail.com>
pkgname=dotman
pkgver=0.2
pkgrel=1
pkgdesc="Very lightweight and simple Dotfile Manager, fully written in bash."
arch=("any")
url="https://github.com/veillain/dotman"
license=("GPL-3.0-or-later")
depends=("git")
provides=("dotman")
conflicts=("dotman")
source=("${pkgname}::git+https://github.com/veillain/dotman.git")
sha256sums=('SKIP')

# pkgver() {
#     cd "${pkgname}"
#     git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

package() {
    cd "${pkgname}"
    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
