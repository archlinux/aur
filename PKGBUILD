#Mainteiner: Boris Timofeev <mashin87@gmail.com>
pkgname=chipper
pkgver=2.11
pkgrel=2
pkgdesc="Chip-8 (Chip-48, Super Chip-48 V1.0 and V1.1) assembler." 
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.hpcalc.org/details.php?id=6735"
depends=()
makedepends=()
install=
source=(http://www.hpcalc.org/hp48/pc/programming/chipper.zip)
md5sums=('c194a19a565938df431d52812ef8278d')


build() {
  cd $srcdir/
  g++ -o $pkgname CHIPPER.C 
}

package() {
  cd $srcdir/
  install -D -m 755 ./$pkgname $pkgdir/usr/bin/$pkgname 
  install -D -m 644 ./CHIPPER.DOC $pkgdir/usr/share/doc/$pkgname/chipper.txt
}

