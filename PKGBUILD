# Contributor: Adria Arrufat <swiftscythe@gmail.com>
 pkgname=pgmtogrob
 pkgver=0.1
 pkgrel=1
 pkgdesc="Converts PGM files to grayscale grob images, readable by HP Calculators"
 arch=('i686' 'x86_64')
 url=("http://www.hpcalc.org/details.php?id=3244")
 license=("GPL")
 depends=('netpbm')
 source=("http://www.hpcalc.org/hp49/pc/misc/pgm2grob.tgz")
 md5sums=('025e0d6f451b00d98d5236b771bc93b9')

 build() {
   cd $srcdir/$pkgname/
   cp /usr/include/netpbm/pgm.h .
   make || return 1
   install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname || return 1
   }
