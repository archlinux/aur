# Maintainer: celeste <renzhewudi2013@outlook.com>

pkgname=clash-geoip
pkgver=202603190030
pkgrel=1
pkgdesc="GeoIP files for Clash"
arch=(any)
url="https://github.com/Loyalsoldier/geoip"
license=(CC-BY-SA-4.0 GPL-3.0-or-later)
source=("${pkgname}-${pkgver}.mmdb::${url}/releases/download/${pkgver}/Country.mmdb")
sha256sums=('9b08956f6a5c84d5a7a74f1f9ba7b3050a41c65476138cc93ce003b14f60e68f')

package() {
    install -Dm0644 "${pkgname}-${pkgver}.mmdb" "${pkgdir}/etc/clash/Country.mmdb"
}
