# Maintainer: Maurice Zhou <ja at apvc punkt uk>
pkgname=rozb3-pac
pkgver=0.0.3
pkgrel=1
pkgdesc="Create ZFS boot environment for every pacman transaction and add GRUB submenu."
arch=(any)
url="https://gitlab.com/m_zhou/rozb3-pac"
license=('GPL')
depends=('grub' 'coreutils' 'bash' 'util-linux' 'zfs')
conflicts=('rozb3-pac-git')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('6e4257810d0089de26032d63fc352fad')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
