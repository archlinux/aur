# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=pdfcrack
pkgver=0.15
pkgrel=1
pkgdesc="Password recovery tool for PDF-files"
arch=('i686' 'x86_64')
url="http://pdfcrack.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5a67a63b980a4b022a983e4f44168781')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  install -D -m755 "$srcdir"/$pkgname-$pkgver/$pkgname \
    "$pkgdir"/usr/bin/$pkgname
}
