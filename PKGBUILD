# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=sar2rrd
pkgver=2.6.2
pkgrel=1
pkgdesc="Perl script that generates RRDTool graphs from sar output"
arch=('any')
url="http://www.trickytools.com/php/sar2rrd.php"
license=('unknown')
depends=('perl-date-calc')
install='sar2rrd.install'
source=("http://www.trickytools.com/downloads/${pkgname}-${pkgver}.pl")

package() {
  install -Dm755 $srcdir/$pkgname-$pkgver.pl "$pkgdir"/usr/bin/$pkgname
}
md5sums=('4fd33a243ae11d4283e83f50d631c0e6')
