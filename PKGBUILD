# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.4.0
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('547c269a0452746fb0ff721caf476aa8bf6f2db96c45bc689cdf956dd4057a03')
depends=('aurutils' 'sudo' 'bash' 's3fs-fuse')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



