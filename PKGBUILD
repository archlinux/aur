# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.2.2
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('7e0182b262812f09aa82a603d5a7de09d02d1c9f53d4b12909bf266f2e7d8d8f')
depends=('aurutils' 'sudo' 'bash' 's3fs-fuse')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



