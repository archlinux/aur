# Maintainer: Tim Reddehase <robustus@rightsrestricted.com>
# Author:     Tim Reddehase <robustus@rightsrestricted.com>

pkgname=serverprint
pkgver=0.1.2
pkgrel=1
pkgdesc="printing on a remote printer via ssh"
arch=('any')
url="https://github.com/0robustus1/serverprint"
license=('MIT')
depends=('perl' 'poppler' 'ghostscript')
source=("https://github.com/0robustus1/serverprint/archive/0.1.2.tar.gz")
sha1sums=('270e6e137b9922ef103d62f5ef62d06d0b4c4420')
provides=('serverprint')
conflicts=('serverprint')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}
