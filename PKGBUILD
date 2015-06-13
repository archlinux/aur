pkgname=svnkit
pkgver=1.8.10
pkgrel=1
pkgdesc="A Subversion library for Java"
arch=('any')
url="http://svnkit.com"
license=('custom')
depends=('java-runtime')
source=(http://svnkit.com/org.tmatesoft.svn_${pkgver}.standalone.zip)
sha256sums=('7bd69cd0024e855259045b196ea33d6a34b9a64835df17982c0dfda246ac3e75')

build(){
  true
}

package() {
  cd $srcdir/svnkit-${pkgver}*
  install -m644 -D lib/svnkit-${pkgver}.jar ${pkgdir}/usr/share/java/svnkit/svnkit.jar
}

