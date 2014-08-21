# Maintainer: James An <james@jamesan.ca>

pkgname=auto-xflux
pkgver=0.1.0
pkgrel=1
pkgdesc='Inputless xflux daemon that geocodes based on your external IP address.'
arch=('any')
url="https://github.com/jamesan/${pkgname}"
license=('GPL')
depends=('xflux')
source=("https://github.com/jamesan/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5f0ae8a448210eb1892ebbb3c27d5c72')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
