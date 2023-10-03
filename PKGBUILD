# Maintainer: FirstAirBender <noblechuk5 at web dot de>

_pkgname=KvKonqi
pkgname=${_pkgname,,}
pkgver=1.1
pkgrel=2
pkgdesc="A Kvantum theme that looks like Breeze theme"
arch=('any')
url="https://github.com/Niru2169/KvKonqi"
license=('GPL3')
depends=('kvantum')
source=(
    "$pkgname-dark@v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}Dark.tar.gz"
    "$pkgname-light@v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}Light.tar.gz"
)
sha256sums=('844fafaa191f641e64cab0ddf6b3434c62537145d48ef8c162dc85a64779e0b2'
            '1279c84c85a62ca614a0637b6467a2fa5b3d17d01fd4c19f67c4cb5408e126fa')

package() {
    install -dm755 $pkgdir/usr/share/Kvantum/
    cp -R $srcdir/${_pkgname}{Dark,Light} -t $pkgdir/usr/share/Kvantum
}
