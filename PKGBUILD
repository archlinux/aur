# Maintainer: James An <james@jamesan.ca>

pkgname=auto-xflux
pkgver=0.4.0
pkgrel=1
pkgdesc='Inputless xflux daemon that geocodes based on your external IP address.'
arch=('any')
url="https://github.com/jamesan/${pkgname}"
license=('GPL')
depends=('xflux')
source=("https://github.com/jamesan/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('7b97a211d908b721e59c9e8f5211cbd2')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
