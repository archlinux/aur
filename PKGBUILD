# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tsingv <tsingv@outlook.com>
pkgname=omniedge-cli
pkgver=0.1.0
pkgrel=2
epoch=
pkgdesc="A reliable and painless connectivity to all your devices in one click."
arch=('x86_64')
url="https://omniedge.io/"
license=('GPL')
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
source=("https://github.com/omniedgeio/omniedge-linux-cli/releases/download/v${pkgver}/omniedge-amd64.zip")
noextract=()
sha256sums=('8e72bad059363a2303c05bfbc338508b4dceb24fd01c13956b519cf181230e75')
validpgpkeys=()

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -D -m 0755 omniedge "${pkgdir}/opt/${pkgname}/omniedge-cli"
    ln -sf "/opt/${pkgname}/omniedge-cli" "${pkgdir}/usr/bin/omniedge-cli"
}
