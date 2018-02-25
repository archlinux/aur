# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.0.11
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('1b1149663c14f1d7bfa39556866f07960e4f922a68eb603e11d0783cddd4ae0c')
depends=('aurutils' 'sudo' 'bash' 's3fs-fuse')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



