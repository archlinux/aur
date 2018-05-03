# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.1.1
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('81639ead60183fb87cc2c81f435238b9fc9402a7398cfc1fd39bc00074ee7b71')
depends=('aurutils' 'sudo' 'bash' 's3fs-fuse')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



