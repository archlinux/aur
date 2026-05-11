# Maintainer: willker <wz dot willker at gmail dot com>
# Contributor: celeste <renzhewudi2013@outlook.com>

pkgname=clash-geoip
pkgver=202605070042
pkgrel=1
pkgdesc="GeoIP files for Clash"
arch=(any)
url="https://github.com/Loyalsoldier/geoip"
license=(CC-BY-SA-4.0 GPL-3.0-or-later)
source=("${pkgname}-${pkgver}.mmdb::${url}/releases/download/${pkgver}/Country.mmdb")
sha256sums=('f214e0fb21c1c661c8420a2a6fd4c2d6576ee61aea3d1dd2f85247e22a3dbde9')

package() {
    install -Dm0644 "${pkgname}-${pkgver}.mmdb" "${pkgdir}/etc/clash/Country.mmdb"
}
