# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.0.6
pkgrel=2
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('94095385e1bb847c900cb2aaa05a5fc3e694b688f9d7a96bf901b39e2d46cb95')
depends=('aurutils' 'sudo' 'bash')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



