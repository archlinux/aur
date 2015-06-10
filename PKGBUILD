# Maintainer: Tim Reddehase <robustus@rightsrestricted.com>
# Author:     Tim Reddehase <robustus@rightsrestricted.com>

pkgname=serverprint
pkgver=0.1.1
pkgrel=1
pkgdesc="printing on a remote printer via ssh"
arch=('any')
url="https://github.com/0robustus1/serverprint"
license=('MIT')
depends=('perl' 'poppler' 'ghostscript')
source=("https://github.com/0robustus1/serverprint/archive/0.1.1.tar.gz")
sha1sums=('d26352c5007ffb9c9d91b4c79685946b41c60fe7')
provides=('serverprint')
conflicts=('serverprint')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}
