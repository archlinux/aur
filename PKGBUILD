# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.0.21
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('cabaab4f53a709505292b7dde4b46b3d1786ead5aa10aa52d8175a53433e3aec')
depends=('aurutils' 'sudo' 'bash' 's3fs-fuse')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



