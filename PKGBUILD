pkgname=svnkit
pkgver=1.8.14
pkgrel=1
pkgdesc="A Subversion library for Java"
arch=('any')
url="http://svnkit.com"
license=('custom')
depends=('java-runtime')
source=(http://svnkit.com/org.tmatesoft.svn_${pkgver}.standalone.zip)
sha256sums=('35e0f5679226ea9bf2f6963464605ec220054aac9cf8c1c6a4f20c01b56e64d7')

build(){
  true
}

package() {
  cd $srcdir/svnkit-${pkgver}*
  install -m644 -D lib/svnkit-${pkgver}.jar ${pkgdir}/usr/share/java/svnkit/svnkit.jar
}

