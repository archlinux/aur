# Maintainer: Sateallia <mail@sateallia.org>
pkgname=plasma6-applet-caldavtasks
pkgver=1.2.2
pkgrel=1
pkgdesc="Plasma 6 widget to view and manage VTODO tasks from any CalDAV-compatible server"
arch=('any')
url="https://github.com/Sinkmanu/Plasma-Widgets"
license=('GPL-3.0-only')
depends=('plasma-workspace' 'qt6-declarative')
_commit=23bf550990f971e2ba25dba9fd9847f7f31e6b34
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Sinkmanu/Plasma-Widgets/archive/${_commit}.tar.gz")
sha256sums=('1c7f159ac68afe35a467efb84aee6661c1d82c723da107c2aa19fccdd90c7f88')

package() {
    cd "${srcdir}/Plasma-Widgets-${_commit}"
    install -dm755 "${pkgdir}/usr/share/plasma/plasmoids/re.unam.caldavtasks"
    cp -r re.unam.caldavtasks/. "${pkgdir}/usr/share/plasma/plasmoids/re.unam.caldavtasks/"
}
