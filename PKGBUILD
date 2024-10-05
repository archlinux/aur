# Contributor: Dct Mei <dctxmei@yandex.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Maintainer: jakka <jakkadoujin at gmail dot com>


pkgname=xray-geoip
pkgver=202410030052
pkgrel=1
pkgdesc="GeoIP List for Xray"
arch=('any')
url="https://github.com/v2fly/geoip"
license=('CCPL:by-sa')
source=("geoip-${pkgver}.dat::${url}/releases/download/${pkgver}/geoip.dat"
        "${url}/raw/master/LICENSE")
sha256sums=('061c2116e650932c8058b663c14cd03be2241c6048bba6a2765ee1ea38481bff'
            '5e436ff8ffbb77d8607220e9bce20c8915d860010feeb6c1ebef5a85688e9b39')

package() {
    install -Dm 644 "geoip-${pkgver}.dat" "${pkgdir}"/usr/share/xray/geoip.dat
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/xray-geoip/
}
