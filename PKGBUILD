# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
# Rendered by .github/workflows/release.yml for each v* tag.
pkgname=compx-control
pkgver=0.1.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for COMPX-based gaming mice (MAD R, VXE R1)"
arch=('any')
url="https://github.com/NasirA1991/compx-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'python-dbus' 'hicolor-icon-theme')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/compx-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f03cce0d3c2fbb56727c61990b417b97f5ac9e51d0419fb240775fdabee830df')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
