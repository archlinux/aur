# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=obs-plugin-tuna-bin
pkgver=1.5.2
pkgrel=1
arch=(x86_64)
pkgdesc="Song information plugin for obs-studio"
url="https://github.com/univrsal/tuna"
license=('GPL2')
depends=("obs-studio")
source=("https://github.com/univrsal/tuna/releases/download/v$pkgver/tuna.v$pkgver.bin.linux.x64.zip")
sha256sums=('fa1f02b1010792f0dd63065142ef7dc8136703213c19c892c2d768ffa25a167e')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/obs-plugins/
  mv tuna/bin/64bit/tuna.so $pkgdir/usr/lib/obs-plugins/
  mkdir -p $pkgdir/usr/share/obs/obs-plugins/
  mv tuna/data $pkgdir/usr/share/obs/obs-plugins/tuna
}
