# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=tinyfilemanager
pkgver=2.4.3
pkgrel=1
pkgdesc="Web based, simple, fast and small file manager"
arch=('any')
url="https://github.com/prasathmani/${pkgname}"
license=('GPL3')
depends=('php')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('4445891a5ad8cf2d784d35902da1a532')

package() {
    cd ${pkgname}-${pkgver}
    install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" "${pkgname}.php"
}
