# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
# Rendered by .github/workflows/release.yml for each v* tag.
# The release tarball is immutable and 994336752841848b52127126078e838150c3de2331bb04bc17a235ab7ab28c92 is injected from the release job.
pkgname=rawm-control
pkgver=0.1.13
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for RAWM gaming mice"
arch=('any')
url="https://github.com/NasirA1991/rawm-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'python-dbus' 'hicolor-icon-theme')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/rawm-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('994336752841848b52127126078e838150c3de2331bb04bc17a235ab7ab28c92')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
