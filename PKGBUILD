# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=obs-plugin-tuna-bin
pkgver=1.5.3
pkgrel=1
arch=(x86_64)
pkgdesc="Song information plugin for obs-studio"
url="https://github.com/univrsal/tuna"
license=('GPL2')
depends=("obs-studio")
source=("https://github.com/univrsal/tuna/releases/download/v$pkgver/tuna.v$pkgver.bin.linux.x64.zip")
sha256sums=('9f193d92c36cbc30c556c03791e089c4c14851d431d4af998a03ec598155cc69')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/obs-plugins/
  mv tuna/bin/64bit/tuna.so $pkgdir/usr/lib/obs-plugins/
  mkdir -p $pkgdir/usr/share/obs/obs-plugins/
  mv tuna/data $pkgdir/usr/share/obs/obs-plugins/tuna
}
