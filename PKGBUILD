# Maintainer: willker <wz dot willker at gmail dot com>
# Contributor: celeste <renzhewudi2013@outlook.com>

pkgname=clash-geoip
pkgver=202605021353
pkgrel=1
pkgdesc="GeoIP files for Clash"
arch=(any)
url="https://github.com/Loyalsoldier/geoip"
license=(CC-BY-SA-4.0 GPL-3.0-or-later)
source=("${pkgname}-${pkgver}.mmdb::${url}/releases/download/${pkgver}/Country.mmdb")
sha256sums=('23bdd8d0526b97bc0dad6ee4fa22a66cc5b02f281f1a97f5f6cbbe5cf7d7140d')

package() {
    install -Dm0644 "${pkgname}-${pkgver}.mmdb" "${pkgdir}/etc/clash/Country.mmdb"
}
