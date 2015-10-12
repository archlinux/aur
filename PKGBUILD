# Maintainer:  Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: felix (fstirlitz)
pkgname=geolite2-country
pkgver=20151012
pkgrel=1
pkgdesc="MaxMind GeoLite2 GeoIP database - Country version"
license=('CCPL:cc-by-sa-3.0')
arch=(any)
url="http://dev.maxmind.com/geoip/geoip2/geolite2/"
source=("http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz")
md5sums=("b2f3a0371f534f9a429ddc6205ffcb2b")

package() {
	install -D -m 0644 GeoLite2-Country.mmdb $pkgdir/usr/share/GeoIP/GeoLite2-Country.mmdb
}
