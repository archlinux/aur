# Maintainer: Nicolas Goy <kuon@goyman.com>

pkgname=zrep
pkgver=1.7.6
pkgrel=1
epoch=
pkgdesc="ZREP ZFS based replication and failover script from bolthole.com"
arch=("any")
url="https://github.com/bolthole/zrep"
license=('custom')
groups=()
depends=(ksh)
source=("https://raw.githubusercontent.com/bolthole/zrep/v$pkgver/$pkgname"
"https://raw.githubusercontent.com/bolthole/zrep/v$pkgver/LICENSE.txt")
md5sums=('9ce0bab4aff7167ae2eb3aa7b64f8983' 'c8bab7291304d748f1133dbd43c992df')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cp $srcdir/LICENSE.txt  $pkgdir/usr/share/licenses/$pkgname/
  chmod +x $srcdir/$pkgname
  cp $srcdir/$pkgname $pkgdir/usr/bin
}
