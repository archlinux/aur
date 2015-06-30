# Maintainer: Sabart Otto - Seberm <seberm[at]gmail[dot]com>

pkgname=perl-supergenpass
pkgver=1.0.0
pkgrel=1
pkgdesc="Perl implementation of Super Gen Pass script"
arch=('any')
license=('custom')
depends=('perl') 
conflicts=('bash-supergenpass')
provides='supergenpass'
optdepends=()
url="http://www.jrsaathoff.com/supergenpass.html"
install=''
source=("http://www.jrsaathoff.com/files/sgp.txt")

md5sums=('d466c9963cbe624fd19acebfd962fcd0')

build() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/sgp.txt $pkgdir/usr/bin/supergenpass
  chmod +x $pkgdir/usr/bin/supergenpass
}
