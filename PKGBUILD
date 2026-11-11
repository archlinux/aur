# Maintainer: Nasir A. <112448715+NasirA1991@users.noreply.github.com>
# Rendered by .github/workflows/release.yml for each v* tag.
pkgname=atk-control
pkgver=0.8.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita configuration tool for ATK/VXE gaming mice"
arch=('any')
url="https://github.com/NasirA1991/atk-control"
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-cairo' 'python-dbus' 'hicolor-icon-theme')
provides=('compx-control')
conflicts=('compx-control' 'compx-control-git' 'atk-control-git')
replaces=('compx-control')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NasirA1991/atk-control/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a66ade8d06fda909d7c2eccd0371c804bc090d03233322c8bf59e1c55a7207eb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr DESTDIR="$pkgdir" ./install.sh
}
