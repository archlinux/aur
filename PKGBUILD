# Maintainer: Nicolas Goy <kuon@goyman.com>

pkgname=zrep
pkgver=2.0.2
pkgrel=1
epoch=
pkgdesc="ZREP ZFS based replication and failover script from bolthole.com"
arch=("any")
url="https://github.com/bolthole/zrep"
license=('custom')
groups=()
depends=()
source=("https://raw.githubusercontent.com/bolthole/zrep/v$pkgver/$pkgname"
"https://raw.githubusercontent.com/bolthole/zrep/v$pkgver/LICENSE.txt")
md5sums=('6e207b03fefecd26f4cc19dcf7ed6038' '6b7753e87858504b28aafdd65f5989b1')

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cp $srcdir/LICENSE.txt  $pkgdir/usr/share/licenses/$pkgname/
  chmod +x $srcdir/$pkgname
  cp $srcdir/$pkgname $pkgdir/usr/bin
}
