# Maintainer: Ramana Kumar <firstname.lastname@gmail.com>
pkgname=squolem
pkgver=2.02
pkgrel=1
pkgdesc="Skolemization-based Quantified Boolean Formula (QBF) solver that generates certificates"
arch=('i686' 'x86_64')
url="http://www.cprover.org/qbv/"
license=('custom:qbv')
source=("http://www.cprover.org/qbv/download/$pkgname-$pkgver-linux.tgz"
        "http://www.cprover.org/qbv/LICENSE.txt")
md5sums=('3c142f4412a7e764bad4378627cbd4cf'
         '38a6fbe518e813958238518ce2cff077')

package() {
  install -D "$srcdir/squolem2" "$pkgdir/usr/bin/squolem2"
  install -D -m644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
