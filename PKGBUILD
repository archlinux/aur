# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.0.3
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('c9bf9ffd6f35c413668f71f9c433eec06ceeac29ffe61f58617791b84a9b89bf')
depends=('aurutils' 'sudo' 'bash')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



