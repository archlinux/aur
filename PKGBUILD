# Maintainer: Sateallia <mail@sateallia.org>
pkgname=plasma6-applet-caldavtasks
pkgver=1.5.0
pkgrel=1
pkgdesc="Plasma 6 widget to view and manage VTODO tasks from any CalDAV-compatible server"
arch=('any')
url="https://github.com/Sinkmanu/Plasma-Widgets"
license=('GPL-3.0-only')
depends=('plasma-workspace' 'qt6-declarative')
_commit=7bf35e65e2a6bbc337379aa105f7daf13c3f26fa
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Sinkmanu/Plasma-Widgets/archive/${_commit}.tar.gz")
sha256sums=('daa18b08cb732413380c15be3bcf814a924b5479661fd3b31cc82d48dc9b2b64')

package() {
    cd "${srcdir}/Plasma-Widgets-${_commit}"
    install -dm755 "${pkgdir}/usr/share/plasma/plasmoids/re.unam.caldavtasks"
    cp -r re.unam.caldavtasks/. "${pkgdir}/usr/share/plasma/plasmoids/re.unam.caldavtasks/"
}
