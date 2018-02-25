# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.0.14
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('e0384d1fd771812c245355d974a9f4906fa0874caf8433f8283d23f8102366d3')
depends=('aurutils' 'sudo' 'bash' 's3fs-fuse')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



