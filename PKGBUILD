# Maintainer:
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jakka <jakkadoujin at gmail dot com>

pkgname=xray-geoip
pkgver=202412120057
pkgrel=1
pkgdesc="GeoIP list for Xray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CC-BY-SA-4.0')
source=("${pkgname}-${pkgver}.dat::${url}/releases/download/${pkgver}/geoip.dat")
sha256sums=('5a184de8e36b5b131e405eb1078856703c0727f097636529cbbe47f38f2fe92d')

package() {
    install -Dm644 "${pkgname}-${pkgver}.dat" "${pkgdir}/usr/share/xray/geoip.dat"
}
