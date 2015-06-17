# Maintainer: M0Rf30

pkgname=jflap
pkgver=7.0
pkgrel=4
pkgdesc="Software to learning the basic concepts of Formal Languages and Automata Theory"
arch=('i686' 'x86_64')
url="http://www.jflap.org/"
license=('CCPL')
conflicts=('j_flap')
depends=('java-environment')
source=(http://www.cs.duke.edu/csed/jflap/jflaptmp/may15-2011/withoutSource/JFLAP.jar
        jflap )

package() {
  cd $srcdir
  mkdir -p $pkgdir/opt/jflap
  cp JFLAP.jar $pkgdir/opt/jflap
  mkdir -p $pkgdir/usr/bin
  cp jflap $pkgdir/usr/bin
  chmod +x $pkgdir/usr/bin/jflap 
}
md5sums=('95d5f8f9f098331f6f61c24f7931589f'
         'fdc683f3cb88b3e336cda4a8d3b14837')
