# Maintainer: notscripter <grx8x0mfy@mozmail.com>
pkgname=tauno-serial-plotter-bin
_pkgname=tauno-serial-plotter
pkgver=1.19.4
pkgrel=17
epoch=
pkgdesc="Serial Plotter for Arduino and other embedded devices."
arch=(i686 x86_64)
url="https://github.com/taunoe/tauno-serial-plotter"
license=('GPL-3.0')
groups=()
depends=(python-pyqt5 python-pyqtgraph)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/taunoe/tauno-serial-plotter/archive/refs/tags/v${pkgver}.tar.gz)
noextract=()
sha256sums=(4ab6d3bcdbb7c84667409f304cfc9f6e0d5ef77b10b7bd78fce8fae07d459363)
validpgpkeys=()

package() {
	cd "$_pkgname-$pkgver"
    install -Dm644 snap/gui/Tauno-Serial-Plotter.desktop "${pkgdir}/usr/share/applications/tauno_serial_plotter.desktop"
    install -Dm644 snap/gui/tauno-plotter.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tauno-plotter.svg"
    install -Dm755 src/tauno-serial-plotter.py "${pkgdir}/usr/bin/tauno-serial-plotter"
}

