# Maintainer:
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jakka <jakkadoujin at gmail dot com>

pkgname=xray-geoip
pkgver=202412190056
pkgrel=1
pkgdesc="GeoIP list for Xray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CC-BY-SA-4.0')
source=("${pkgname}-${pkgver}.dat::${url}/releases/download/${pkgver}/geoip.dat")
sha256sums=('b75b994afcbb82f0b417001c015fa64e832bb6e66faf3a69ad4e423c9b29a463')

package() {
    install -Dm644 "${pkgname}-${pkgver}.dat" "${pkgdir}/usr/share/xray/geoip.dat"
}
