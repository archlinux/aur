# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tsingv <tsingv@outlook.com>
pkgname=("omniedge-cli")
pkgver=0.2.2
pkgrel=0
epoch=
pkgdesc="A reliable and painless connectivity to all your devices in one click."
arch=("x86_64")
url="https://omniedge.io/"
license=()
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/omniedgeio/app-release/releases/download/v${pkgver}/omniedgecli-amd64.zip")
noextract=()
sha512sums=('36fad9ea1fe61cabb62597e9b6f933a2571265dcb91fc13beba8d80658543d47cd59340dbac92a6e7fb1b2da1bea9996f962207bfd043a1bef995e07c1b613a2')
validpgpkeys=()

package() {
    install -d "${pkgdir}/opt/omniedge-cli"
    install -d "${pkgdir}/usr/bin"
    install -D -m 0755 omniedge "${pkgdir}/opt/omniedge-cli/omniedge"
    ln -sf "${pkgdir}/opt/omniedge-cli/omniedge" "${pkgdir}/usr/bin/omniedge"
}
