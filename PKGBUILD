# Maintainaer: SpepS <dreamspepser at yahoo dot it>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Nate Crouch <randypenguin@gmail.com>

pkgname=djvu2pdf
pkgver=0.9.2
pkgrel=1
pkgdesc="A small script to convert DjVu files to PDF files"
arch=('any')
url="http://0x2a.at/s/projects/djvu2pdf"
license=('GPL' 'LGPL')
depends=('ghostscript' 'netpbm' 'djvulibre')
source=("http://0x2a.at/site/projects/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('af93c29a857a014f86dffcff6c773ef1')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bin
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  # man
  install -Dm644 $pkgname.1.gz \
    "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}
