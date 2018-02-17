# Maintainer: Marcin Mielniczuk <marmistrz.dev at zoho dot eu>

pkgname=universal-components-git
pkgver=20171203
_vertag=da725c4f7bbe560fcd59cfb0fc27777a6198a56b
pkgrel=1
pkgdesc="Universal QtQuick 2.0 components. Qt Quick Controls 2.0 backend"
arch=('any')
license=('BSD-3-Clause')
depends=('qt5-quickcontrols2')
makedepends=('git')
source=("git+https://github.com/M4rtinK/universal-components.git#commit=${_vertag}")
sha1sums=("SKIP")
options=(!strip)

package() {
    DESTDIR="${pkgdir}/usr/lib/qt/qml"    
    cd "${srcdir}/universal-components/controls"
    mkdir -p "$DESTDIR"
    cp -a UC "$DESTDIR"
}


