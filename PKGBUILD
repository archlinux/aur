# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
# Rendered by .github/workflows/release.yml for each v* tag.
pkgname=atk-control
pkgver=0.4.0
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
sha256sums=('fbc4dd8712d9adf21fbd5555515061b05fb8777321bbdf1b730749aa5b9eff86')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
