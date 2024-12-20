# Maintainer:
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jakka <jakkadoujin at gmail dot com>

pkgname=xray-geoip
pkgver=202412201411
pkgrel=1
pkgdesc="GeoIP list for Xray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CC-BY-SA-4.0')
source=("${pkgname}-${pkgver}.dat::${url}/releases/download/${pkgver}/geoip.dat")
sha256sums=('3f72cea0044a747fcb28cce36f70946c9e664c55949046fd22679090edc264b9')

package() {
    install -Dm644 "${pkgname}-${pkgver}.dat" "${pkgdir}/usr/share/xray/geoip.dat"
}
