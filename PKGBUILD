# Maintainer: graysky <therealgraysky AT protonmail DOT com>
 
pkgname=speedtest-netperf
_commit=463590e2bcf94e09890f7ba98e910ff58090e29b
arch=(any)
pkgver=1.00
pkgrel=1
license=(GPL )
url='https://github.com/openwrt/packages/tree/master/net/speedtest-netperf/files'
pkgdesc='Measure network performance and bufferbloat'
depends=(netperf)
source=("https://raw.githubusercontent.com/openwrt/packages/$_commit/net/$pkgname/files/$pkgname.sh")
b2sums=('9ecf41fe126ebda17d323d07eceab6447e6a388244c50c09e0768fe680bf014969e846c81313967f2be504cbb8fd0abc63aa3c078f5ba78e41993ffe23b29ece')

package() {
  install -d "$pkgdir/usr/bin"
  install -Dm755 $srcdir/$pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
