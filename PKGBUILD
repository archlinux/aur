# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='mcpelauncher-hx-script'
pkgver=v1.1
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
    'bac567db8d71b9292c2b9c4b7acd416a2942c1958f638959d9d86a61816902ca'
    '200441f4095266168667ccc405760c9f5a7fb28d0db7f69698b34f2e54d760c0'
)

package() {
    cd "${srcdir}"
    install -Dm755 script.sh "${pkgdir}/usr/bin/${pkgname}"
}
