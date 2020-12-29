# Maintainer: Maurice Zhou <ja at apvc punkt uk>
pkgname=rozb3-pac
pkgver=0.0.6
pkgrel=1
pkgdesc="Create ZFS boot environment for every pacman transaction and add GRUB submenu."
arch=(any)
url="https://gitlab.com/m_zhou/rozb3-pac"
license=('GPL')
depends=('grub' 'coreutils' 'bash' 'util-linux' 'zfs')
conflicts=('rozb3-pac-git')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('591496af759dffe2c042ca279fbd8a53')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
