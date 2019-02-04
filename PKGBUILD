# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.2.1
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('ed37a3a0a49662f4260a76d651c967580c209ddd4e2fd8434a10434dae23f12e')
depends=('aurutils' 'sudo' 'bash' 's3fs-fuse')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



