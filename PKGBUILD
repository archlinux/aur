# Maintainer: Maurice Zhou <ja at apvc punkt uk>
pkgname=rozb3-pac
pkgver=0.1.2
pkgrel=1
pkgdesc="pacman hook for ZFS boot environment"
arch=(any)
url="https://gitlab.com/m_zhou/rozb3-pac"
license=('GPL')
depends=('bieaz')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
md5sums=('1ba2b03360b32a5d28432186a45710d6')
