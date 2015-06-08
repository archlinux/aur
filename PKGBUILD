# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=brag
pkgver=1.4.1
pkgrel=1
pkgdesc="Downloads and assembles multipart Usenet binaries"
arch=(i686 x86_64)
url="http://brag.sourceforge.net/"
license=('GPL2')
depends=('tcl' 'uudeview')
source=("http://$pkgname.sourceforge.net/$pkgname-$pkgver.tar.gz")
sha256sums=('400d0a60ac94ff8ed7724c031882c1fbbcee1ec39397a11c461391e17c5418ee')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make ROOT="$pkgdir" install
}
