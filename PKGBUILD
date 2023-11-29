# Maintainer: Harrison <htv04rules at gmail com>

# Package info
_pkgname=kmozillahelper
pkgname=$_pkgname-bin
pkgver=5.0.6
pkgrel=1
pkgdesc="KDE mozilla integration"
arch=(x86_64)
url="https://github.com/openSUSE/kmozillahelper"
license=(MIT)
depends=(
  kio5
  ki18n5
  knotifications5
  kwindowsystem5
)
provides=($_pkgname)
conflicts=($_pkgname)

# RPM
_opensuse="Tumbleweed"
_rpmver="$pkgver-16.72"
source=("https://download.opensuse.org/repositories/mozilla/openSUSE_$_opensuse/x86_64/kmozillahelper-$_rpmver.x86_64.rpm")
sha256sums=("13324d5ba8755f033d54daf81343b9ba9a0a904079fd04834707c61e7b049f33")

# Build package
package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
