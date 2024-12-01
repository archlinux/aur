# Maintainer:
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jakka <jakkadoujin at gmail dot com>

pkgname=xray-geoip
pkgver=202411280056
pkgrel=1
pkgdesc="GeoIP list for Xray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CC-BY-SA-4.0')
source=("${pkgname}-${pkgver}.dat::${url}/releases/download/${pkgver}/geoip.dat")
sha256sums=('0b92efbe8e6a8255d3142751964931d2ca4801b51f0cd12c05963e23e0062a52')

package() {
    install -Dm644 "${pkgname}-${pkgver}.dat" "${pkgdir}/usr/share/xray/geoip.dat"
}
