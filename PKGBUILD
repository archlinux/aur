# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.0.5
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('c41ccc1d7d096b7b7a3cdef76255d123d27de5676320cf3d88e72c4a8f7f6db4')
depends=('aurutils' 'sudo' 'bash')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



