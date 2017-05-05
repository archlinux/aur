# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=pdfcrack
pkgver=0.16
pkgrel=1
pkgdesc="Password recovery tool for PDF-files"
arch=('i686' 'x86_64')
url="http://pdfcrack.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('1f7d74146a100c3679462d19feb1e931')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -D -m755 "$srcdir/$pkgname-$pkgver/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
}
