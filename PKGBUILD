# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
# Rendered by .github/workflows/release.yml for each v* tag.
# The release tarball is immutable and 6b335199b26d554dc3c73dd82a56ba2c9c60bbd1c0fcd5adfaba722a889c16d6 is injected from the release job.
pkgname=rawm-control
pkgver=0.1.14
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for RAWM gaming mice"
arch=('any')
url="https://github.com/NasirA1991/rawm-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'python-dbus' 'hicolor-icon-theme')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/rawm-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6b335199b26d554dc3c73dd82a56ba2c9c60bbd1c0fcd5adfaba722a889c16d6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
