# Maintainer:
# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jakka <jakkadoujin at gmail dot com>

pkgname=xray-geoip
pkgver=202412050058
pkgrel=1
pkgdesc="GeoIP list for Xray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CC-BY-SA-4.0')
source=("${pkgname}-${pkgver}.dat::${url}/releases/download/${pkgver}/geoip.dat")
sha256sums=('62f13f734ec2e9a2038fef4fb904aa7b7d6eeab2e315388ccc239c0476d503c1')

package() {
    install -Dm644 "${pkgname}-${pkgver}.dat" "${pkgdir}/usr/share/xray/geoip.dat"
}
