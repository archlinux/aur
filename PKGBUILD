# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor : Yamada Hayao <hayao@fascode.net>

pkgname=gnome-shell-extension-coverflow-alt-tab
pkgver=1.14
pkgrel=1
pkgdesc="Replacement of Alt-Tab, iterates through windows in a cover-flow manner"
arch=('any')
url="https://github.com/dmo60/CoverflowAltTab"
license=('GPL')
source+=("${url}/archive/refs/tags/v${pkgver}.zip")
b2sums=('4d3b6e256f7c426908acf12e80786a433618b4966afee10880e805c847d19ed60d8eb34d1a466c2e55e4615fc2201067f7288cd7d299689154cce95ade15fc6a')
install=gschemas.install
_dir="CoverflowAltTab-${pkgver}"

package(){
    cd "${srcdir}/${_dir}"
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
    make all LOCALINSTALL=true SUPER_PATH="${pkgdir}/usr/share/gnome-shell/extensions"
}
