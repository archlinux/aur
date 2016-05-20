# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=snap-pac
pkgver=0.6
pkgrel=1
pkgdesc="Make pacman automatically use snapper to create pre/post snapshots like openSUSE's YaST"
arch=(any)
url="https://github.com/wesbarnett/snap-pac"
license=('GPL')
depends=(snapper)
install='snap-pac.install'
source=(${url}/archive/${pkgver}.tar.gz
        'snap-pac.install')
md5sums=('350a7570cf9eda6af67651ef23e3147e'
         '20869667ed9046354dc0caa056d607fa')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
