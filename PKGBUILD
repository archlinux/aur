# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
# Rendered by .github/workflows/release.yml for each v* tag.
pkgname=rawm-control
pkgver=0.1.9
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for RAWM gaming mice"
arch=('any')
url="https://github.com/NasirA1991/rawm-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'python-dbus' 'hicolor-icon-theme')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/rawm-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a29608d04e8e80fb9f1ef08484e1d1eb62585b1e2536cee89c84d4813bdce2f2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
