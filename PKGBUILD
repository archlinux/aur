# Maintainer: Maurice Zhou <ja at apvc punkt uk>
pkgname=rozb3-pac
pkgver=0.1.7
pkgrel=1
pkgdesc="create ZFS boot environment for pacman transactions"
arch=(any)
url="https://gitlab.com/m_zhou/rozb3-pac"
license=('GPL')
depends=('bieaz')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
md5sums=('639b22e6bd8bd92361e0bc6cdae522fc')
