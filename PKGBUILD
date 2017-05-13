# Maintainer: alexandru.ianu@gmail.com


pkgname=deluge-gtk-graceful-kill
pkgver=d1.3_v15
pkgrel=1
pkgdesc="Systemd service to gracefully close deluge before shutdown/restart, avoiding a lock."
arch=('i686' 'x86_64')
url=https://forum.manjaro.org/index.php?topic=13035.0
license=('GPL2')
depends=('systemd' 'deluge')
source=('https://drive.google.com/uc?export=download&id=0Bwo48VGHJUUrVzBhSi0yMHR1UWc')
md5sums=('6e3de6d2257cac172ff3b685fc987d3b')

install="$pkgname".install

package() {
  cp -a "$srcdir/usr" "$pkgdir"
}
