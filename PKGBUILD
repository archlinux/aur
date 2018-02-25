# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.0.22
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('6b668906c9f9dd6b3b7e0ad8dacb48b68460af20bf5bf37cfd523088ab620bc5')
depends=('aurutils' 'sudo' 'bash' 's3fs-fuse')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



