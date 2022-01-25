# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tsingv <tsingv@outlook.com>
pkgname=("omniedge-cli")
pkgver=0.2.1
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
sha512sums=('e82b437dbe4911e42208f16b75cc0b5cedbd59ab0deaba4d832a4dc1510c7591f3e2984ea18fefb9e96594e87d7ec324f5f08d0e7e92e6a72fc44e129a62b5fb')
validpgpkeys=()

package() {
    install -d "${pkgdir}/opt/omniedge-cli"
    install -d "${pkgdir}/usr/bin"
    install -D -m 0755 omniedge "${pkgdir}/opt/omniedge-cli/omniedge"
    ln -sf "${pkgdir}/opt/omniedge-cli/omniedge" "${pkgdir}/usr/bin/omniedge"
}
