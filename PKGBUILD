# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
# Rendered by .github/workflows/release.yml for each v* tag.
# The release tarball is immutable and e6c464c93f4d39830ebc13c8feda7fd3414360257c3508b5404853341702b514 is injected from the release job.
pkgname=rawm-control
pkgver=0.1.11
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for RAWM gaming mice"
arch=('any')
url="https://github.com/NasirA1991/rawm-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'python-dbus' 'hicolor-icon-theme')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/rawm-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e6c464c93f4d39830ebc13c8feda7fd3414360257c3508b5404853341702b514')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
