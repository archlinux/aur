# Maintainer:  Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: felix (fstirlitz)
pkgname=geolite2-city
pkgver=20150808
pkgrel=1
pkgdesc="MaxMind GeoLite2 GeoIP database - City version"
license=('CCPL:cc-by-sa-3.0')
arch=(any)
url="http://dev.maxmind.com/geoip/geoip2/geolite2/"
source=("http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz")
md5sums=("4a74d6cbb9fbc0545bdae21b9d97fdfd")

package() {
	install -D -m 0644 GeoLite2-City.mmdb $pkgdir/usr/share/GeoIP/GeoLite2-City.mmdb
}
