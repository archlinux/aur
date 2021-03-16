# Maintainer: Maurice Zhou <ja at apvc punkt uk>
pkgname=rozb3-pac
pkgver=0.2.3
pkgrel=1
pkgdesc="pacman hook for bieaz"
arch=(any)
url="https://gitlab.com/m_zhou/rozb3-pac"
license=('GPL')
depends=('bieaz>=0.1.3')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
md5sums=('0c23e9a1ebd1cc0b70ccba6619ddf554')
