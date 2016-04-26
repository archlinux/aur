# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=snap-pac
pkgver=0.5
pkgrel=1
pkgdesc="Make pacman automatically use snapper to create pre/post snapshots like openSUSE's YaST"
arch=(any)
url="https://github.com/wesbarnett/snap-pac"
license=('GPL')
depends=(snapper)
install='snap-pac.install'
source=(${url}/archive/${pkgver}.tar.gz
        'snap-pac.install')
md5sums=('bd2739f1e5fc25f46d47a34108ff1b6e'
         '4e98ed8fbee6487ba53d23f9a666a7ce')

package() {
    cd "$pkgname-$pkgver"
    ./install $pkgdir
}
