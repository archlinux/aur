#Maintainer: Joerg Schuck <joerg_schuck at web dot de>
#Contributor: Wenzhi Liang
pkgname=jago
pkgver=6.2
pkgrel=1
pkgdesc="a SGF viewer + an IGS client + GMP client"
url="http://jagoclient.sourceforge.net/"
arch=('any')
license=('GPL2')
depends=(java-environment desktop-file-utils)
source=(http://jagoclient.sourceforge.net/jago.jar jago.png jago.desktop)
noextract=(jago.jar)
options=(!strip)
install=jago.install

package() {
  cd $srcdir
  install -D -m644 jago.jar ${pkgdir}/usr/share/java/jago/jago.jar
  install -D -m644 jago.png ${pkgdir}/usr/share/pixmaps/jago.png
  install -D -m644 jago.desktop ${pkgdir}/usr/share/applications/jago.desktop
}
md5sums=('a8dc1aa00b521cf58e7c60513792d361'
         'd139e3678c92391f001d332649757ea4'
         'c91ad9368fa73eae8128f0cd66d3e7a6')
sha256sums=('6200ffa1ba04b323046c7fb87d293c6f686c10795d3a02f733213cf10c99d4c7'
            'd62858c2397d84d4d76baf751b45940d845a619a67b3798b07b9149a8a106329'
            '82b4c1b2bb37e0016925c1e4e6075867258d06039ff8936ea6418a371c391099')
