# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=obs-plugin-tuna-bin
pkgver=1.4.2
pkgrel=2
arch=(x86_64)
pkgdesc="Song information plugin for obs-studio"
url="https://github.com/univrsal/tuna"
license=('GPL2')
depends=("obs-studio" "taglib" "libmpdclient")
source=("https://github.com/univrsal/tuna/releases/download/v1.4.2/tuna.v1.4.2.ubuntu.x64.zip")
sha256sums=('39329fed737a92a076791ebfbedc1c414c132e0415f59018ed7476769b4df682')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/obs-plugins/
  mv tuna/bin/64bit/tuna.so $pkgdir/usr/lib/obs-plugins/
  mkdir -p $pkgdir/usr/share/obs/obs-plugins/
  mv tuna/data $pkgdir/usr/share/obs/obs-plugins/tuna
}
