# Maintainer: Maurice Zhou <ja at apvc punkt uk>
pkgname=rozb3-pac
pkgver=0.0.7
pkgrel=1
pkgdesc="Create ZFS boot environment for every pacman transaction and add GRUB submenu."
arch=(any)
url="https://gitlab.com/m_zhou/rozb3-pac"
license=('GPL')
depends=('grub' 'coreutils' 'bash' 'util-linux' 'zfs')
conflicts=('rozb3-pac-git')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
md5sums=('a5e5f9616faf048766be134ad155298c')
