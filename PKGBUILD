# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='mcpelauncher-hx-script'
pkgver=v1.0
pkgrel=1
#epoch=
pkgdesc="A script that downloads ChristopherHX's mcpelauncher fork. Doesn't check for updates, so just run it every once and a while."
arch=('any')
url="https://github.com/ChristopherHX/mcpelauncher-manifest"
license=('GPL3')
groups=()
depends=('git' 'mcpelauncher-msa-git' 'mcpelauncher-msa-ui-qt-git')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
#changelog=
source=("script.sh")
noextract=()
sha256sums=('1238a0a25160ca9816fdb1b46b35d4f30e1b25e5c9365efe02a2a7d61846f50f')

package() {
    cd "${srcdir}"
    install -Dm755 script.sh "${pkgdir}/usr/bin/${pkgname}"
}
