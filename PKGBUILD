# Maintainer: Eric Chu <eric@ericchu.net>
pkgname=shomepass
pkgver=1
pkgrel=1
pkgdesc='A systemd homepass service'
arch=('any')
url='https://github.com/ericchu94/shomepass'
license=('GPL')
depends=('hostapd')
source=('git+https://github.com/ericchu94/shomepass.git')
noextract=()
md5sums=('SKIP')

package() {
  mkdir -p $pkgdir/etc/shomepass/
  cp shomepass/shomepass.conf.example $pkgdir/etc/shomepass/

  mkdir -p $pkgdir/usr/bin/
  cp shomepass/shomepass $pkgdir/usr/bin/

  mkdir -p $pkgdir/usr/lib/systemd/system/
  cp shomepass/shomepass.service $pkgdir/usr/lib/systemd/system/
}
