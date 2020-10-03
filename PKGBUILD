# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=obs-plugin-tuna-bin
pkgver=1.5.1
pkgrel=1
arch=(x86_64)
pkgdesc="Song information plugin for obs-studio"
url="https://github.com/univrsal/tuna"
license=('GPL2')
depends=("obs-studio" "taglib" "libmpdclient")
source=("https://github.com/univrsal/tuna/releases/download/v$pkgver/tuna.v$pkgver.bin.linux.x64.zip")
sha256sums=('f5e8408afb180ce0f6c25e755b8f4641a8128d4b7301c73ac7f7cd59e44db010')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/obs-plugins/
  mv tuna/bin/64bit/tuna.so $pkgdir/usr/lib/obs-plugins/
  mkdir -p $pkgdir/usr/share/obs/obs-plugins/
  mv tuna/data $pkgdir/usr/share/obs/obs-plugins/tuna
}
