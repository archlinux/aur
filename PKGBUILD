# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: XZS <d dot f dot fischer at web dot de>


pkgname=gnome-shell-extension-coverflow-alt-tab
pkgver=1.13
pkgrel=1
pkgdesc="Replacement of Alt-Tab, iterates through windows in a cover-flow manner"
arch=('any')
url="https://github.com/dmo60/CoverflowAltTab"
license=('GPL')
source+=("${url}/archive/refs/tags/v${pkgver}.zip")
md5sums+=('SKIP')
install=gschemas.install
_dir="CoverflowAltTab-${pkgver}"

package(){
    cd "${srcdir}/${_dir}"
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
    make all LOCALINSTALL=true SUPER_PATH="${pkgdir}/usr/share/gnome-shell/extensions"
}
