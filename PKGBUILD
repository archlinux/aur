# Maintainer: Sterophonick
# i made this package because i needed 20 for my funny compsci class
pkgname=java-20-jdk
_pkgname='java-20-jdk'
pkgver=20.0.2
pkgrel=1
pkgdesc='Official Java SE 20 JDK'
url='https://www.oracle.com/java/technologies/javase/jdk20-archive-downloads.html'
arch=(x86_64)
source=(https://download.oracle.com/java/20/archive/jdk-20.0.2_linux-x64_bin.tar.gz)
md5sums=('8bc65a504421051c41df053fb06f804a')
license=('nftc')
options=(!debug !strip)

package() {
  mkdir -p $pkgdir/usr/lib/jvm/java-20-jdk
  cp -r $srcdir/jdk-20.0.2/* $pkgdir/usr/lib/jvm/java-20-jdk
}
