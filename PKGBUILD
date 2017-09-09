# Maintainer: Manoel Vilela <manoel_vilela@engineer.com>

_pkg=DicAberto
pkgname=stardict-pt
pkgver=1.0
pkgrel=1
pkgdesc="A Portuguese dictionary for Stardict from dicionario-aberto.net"
arch=("x86_64" "i686")
url="http://dicionario-aberto.net/"
license=('GPL')
depends=(stardict)
provides=(stardict-pt-br)
source=("http://dicionario-aberto.net/stardict-DicAberto.tar.bz2")
md5sums=('cf1a5616d9f020c77b10c521b976ca2c')

package() {
  install -Dm644 "$srcdir/$_pkg/DicAberto.dict" -t "$pkgdir/usr/share/stardict/dic/$_pkg/"
  install -Dm644 "$srcdir/$_pkg/DicAberto.idx" -t "$pkgdir/usr/share/stardict/dic/$_pkg/"
  install -Dm644 "$srcdir/$_pkg/DicAberto.ifo" -t "$pkgdir/usr/share/stardict/dic/$_pkg/"
}
