# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='mcpelauncher-hx-script'
pkgver=v1.3
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
    'ab79172ff9fc5e4e8c72ff9a1fe008e5b8666baa70065fe1d4eb040342bfed87'
    '82937b6f0fbf38a899175381a95109adbb18a36a70bdf57579295125c5f4cc5c'
)

package() {
    cd "${srcdir}"
    install -Dm755 script.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 script.py "${pkgdir}/usr/share/${pkgname}/script.py"
}
