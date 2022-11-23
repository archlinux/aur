# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=tinyfilemanager
pkgver=2.5.0
pkgrel=1
pkgdesc="Web based, simple, fast and small file manager"
arch=('any')
url="https://github.com/prasathmani/${pkgname}"
license=('GPL3')
depends=('php')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('e0f548ada7651e985f0c1010888a116e')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" "${pkgname}.php"
}
