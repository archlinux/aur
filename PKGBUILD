# Maintainer: willker <wz dot willker at gmail dot com>
# Contributor: celeste <renzhewudi2013@outlook.com>

pkgname=clash-geoip
pkgver=202604300043
pkgrel=1
pkgdesc="GeoIP files for Clash"
arch=(any)
url="https://github.com/Loyalsoldier/geoip"
license=(CC-BY-SA-4.0 GPL-3.0-or-later)
source=("${pkgname}-${pkgver}.mmdb::${url}/releases/download/${pkgver}/Country.mmdb")
sha256sums=('21a9e861a150cff370b62ddc3124c7f9bc60cf1907df3132ca30b1c56fd5cccb')

package() {
    install -Dm0644 "${pkgname}-${pkgver}.mmdb" "${pkgdir}/etc/clash/Country.mmdb"
}
