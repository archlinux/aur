pkgname=wowzers
pkgver=1.0
pkgrel=1
pkgdesc="A silly lil guy for your terminal"
arch=('any')
license=('MIT')
depends=('bash')
source=('baxlotl-says')
md5sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/baxlotl-says" "${pkgdir}/usr/bin/wowzers"
}
