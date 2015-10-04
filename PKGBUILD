pkgname=svnkit
pkgver=1.8.11
pkgrel=1
pkgdesc="A Subversion library for Java"
arch=('any')
url="http://svnkit.com"
license=('custom')
depends=('java-runtime')
source=(http://svnkit.com/org.tmatesoft.svn_${pkgver}.standalone.zip)
sha256sums=('52b3acefa52cbdb49d02ffd36371338d5ba4524f3467b53e69960c56be296b5b')

build(){
  true
}

package() {
  cd $srcdir/svnkit-${pkgver}*
  install -m644 -D lib/svnkit-${pkgver}.jar ${pkgdir}/usr/share/java/svnkit/svnkit.jar
}

