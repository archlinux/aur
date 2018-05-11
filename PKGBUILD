# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.2.0
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('8a4c0f79b4180f36c1cd62f394f0d2f236a2282fb49476dad8a0854d832a230d')
depends=('aurutils' 'sudo' 'bash' 's3fs-fuse')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



