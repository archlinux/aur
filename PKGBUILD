# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='mcpelauncher-hx-script'
pkgver=v1.2
pkgrel=1
#epoch=
pkgdesc="A script that downloads ChristopherHX's mcpelauncher fork. Doesn't check for updates, so just run it every once and a while."
arch=('any')
url="https://github.com/ChristopherHX/mcpelauncher-manifest"
license=('GPL3')
groups=()
depends=('git' 'mcpelauncher-msa-git' 'mcpelauncher-msa-ui-qt-git' 'python')
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
source=("script.sh" "script.py")
noextract=()
sha256sums=(
    '1f13579b702c4ece07253cfa5a96c85a8f27854464ea7c8d127a143c5e215ec6'
    '200441f4095266168667ccc405760c9f5a7fb28d0db7f69698b34f2e54d760c0'
)

package() {
    cd "${srcdir}"
    install -Dm755 script.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 script.py "${pkgdir}/usr/share/${pkgname}/script.py"
}
