# Maintainer: James An <james@jamesan.ca>

pkgname=auto-xflux
pkgver=0.3.0
pkgrel=1
pkgdesc='Inputless xflux daemon that geocodes based on your external IP address.'
arch=('any')
url="https://github.com/jamesan/${pkgname}"
license=('GPL')
depends=('xflux')
source=("https://github.com/jamesan/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e5cb174913ad2c41070eaed821755a92')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
