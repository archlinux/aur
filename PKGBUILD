# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=geoip-asndata
pkgver=20140703
pkgrel=2
pkgdesc="ASN database for geoip IP location lookups"
depends=('geoip')
url='http://www.maxmind.com/'
arch=('any')
license=('CCPL')
source=( 'http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz'
         'http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNumv6.dat.gz' )
sha1sums=('SKIP' 'SKIP') # skipping checksum because this changes rapidly

package() {
  install -Dm 444 GeoIPASNum.dat ${pkgdir}/usr/share/GeoIP/GeoIPASNum.dat
  install -Dm 444 GeoIPASNumv6.dat ${pkgdir}/usr/share/GeoIP/GeoIPASNumv6.dat
}
