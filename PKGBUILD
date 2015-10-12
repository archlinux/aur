# Maintainer:  Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: felix (fstirlitz)
pkgname=geolite2-city
pkgver=20151012
pkgrel=1
pkgdesc="MaxMind GeoLite2 GeoIP database - City version"
license=('CCPL:cc-by-sa-3.0')
arch=(any)
url="http://dev.maxmind.com/geoip/geoip2/geolite2/"
source=("http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz")
md5sums=("e42849c85a3081b0aff44b5b5dc63716")

package() {
	install -D -m 0644 GeoLite2-City.mmdb $pkgdir/usr/share/GeoIP/GeoLite2-City.mmdb
}
