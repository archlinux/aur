# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=reposync
pkgver=0.0.19
pkgrel=1
arch=('any')
license=('MIT')
source=(reposync.sh)
pkgdesc="Wrapper for aursync"
sha256sums=('fe0b335ad2e26b2923cfc416ddad6c94fccb283a7ea1ae93ed8e090a87d8e6b9')
depends=('aurutils' 'sudo' 'bash' 's3fs-fuse')

package () {
    install -Dm755 $srcdir/reposync.sh $pkgdir/usr/bin/reposync
}



