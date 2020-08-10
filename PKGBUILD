# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='mcpelauncher-hx-script'
pkgver=v1.4
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
source=("script.py")
noextract=()
sha256sums=(
    '27d13e591432b9323b9d7e7d32c73ac2b979d53accf9b15f947298af366f47a2'
)

package() {
    cd "${srcdir}"
    install -Dm755 script.py "${pkgdir}/usr/bin/${pkgname}"
}
