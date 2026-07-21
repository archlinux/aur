# Maintainer: Sateallia <mail@sateallia.org>
pkgname=plasma6-applet-caldavtasks
pkgver=1.3.0
pkgrel=1
pkgdesc="Plasma 6 widget to view and manage VTODO tasks from any CalDAV-compatible server"
arch=('any')
url="https://github.com/Sinkmanu/Plasma-Widgets"
license=('GPL-3.0-only')
depends=('plasma-workspace' 'qt6-declarative')
_commit=339629fc8a16ac0806aa84ff0ea473ac728f6f89
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Sinkmanu/Plasma-Widgets/archive/${_commit}.tar.gz")
sha256sums=('2f12d22ac3dc4e6a24f0dc9b36424dc498c920a31d74ce2d3066c7b794102b4d')

package() {
    cd "${srcdir}/Plasma-Widgets-${_commit}"
    install -dm755 "${pkgdir}/usr/share/plasma/plasmoids/re.unam.caldavtasks"
    cp -r re.unam.caldavtasks/. "${pkgdir}/usr/share/plasma/plasmoids/re.unam.caldavtasks/"
}
