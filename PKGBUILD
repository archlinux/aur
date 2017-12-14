# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=dm-writeboost
pkgver=2.2.8
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

md5sums=('dda0c269e26b2d3d2576b5e3afe189c4')
