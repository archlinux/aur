# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=pdfcrack
pkgver=0.14
pkgrel=1
pkgdesc="Password recovery tool for PDF-files"
arch=('i686' 'x86_64')
url="http://pdfcrack.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b44e08c2ebda8ad04c8cfa577b18c7b1')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  install -D -m755 "$srcdir"/$pkgname-$pkgver/$pkgname \
    "$pkgdir"/usr/bin/$pkgname
}
