# Maintainer: James An <james@jamesan.ca>

pkgname=auto-xflux
pkgver=0.2.0
pkgrel=1
pkgdesc='Inputless xflux daemon that geocodes based on your external IP address.'
arch=('any')
url="https://github.com/jamesan/${pkgname}"
license=('GPL')
depends=('xflux')
source=("https://github.com/jamesan/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3b5f00eaf76be587c7afca446ebf5391')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}
