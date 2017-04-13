# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=dm-writeboost
pkgver=2.2.7
pkgrel=1
pkgdesc="Log-structured Caching for Linux"
arch=('any')
url="https://github.com/akiradeveloper/dm-writeboost"
license=('GPL2')
depends=('dkms')
options=(!strip)
source=("https://github.com/akiradeveloper/dm-writeboost/archive/v${pkgver}.tar.gz")

package() {
	install -dm755 ${pkgdir}/usr/src/${pkgname}-${pkgver}/
	install -m644 ${pkgname}-${pkgver}/src/* ${pkgdir}/usr/src/${pkgname}-${pkgver}/
}

md5sums=('0918ceb0cb9c6d9b7b39072222c14029')
