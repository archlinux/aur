# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
# Rendered by .github/workflows/release.yml for each v* tag.
pkgname=atk-control
pkgver=0.5.2
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for ATK/VXE gaming mice (MAD R, VXE R1)"
arch=('any')
url="https://github.com/NasirA1991/atk-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'python-dbus' 'hicolor-icon-theme')
provides=('compx-control')
conflicts=('compx-control' 'compx-control-git' 'atk-control-git')
replaces=('compx-control')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/atk-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4fc258f53a5946d13c928455710de7c59294dcf0731317ebe3b1fcb24b603cc1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
