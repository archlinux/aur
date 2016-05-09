pkgname=svnkit
pkgver=1.8.12
pkgrel=1
pkgdesc="A Subversion library for Java"
arch=('any')
url="http://svnkit.com"
license=('custom')
depends=('java-runtime')
source=(http://svnkit.com/org.tmatesoft.svn_${pkgver}.standalone.zip)
sha256sums=('3e05876804d6dca8ef30b21154b1c57863b580ee801dcd82e578c82576d089db')

build(){
  true
}

package() {
  cd $srcdir/svnkit-${pkgver}*
  install -m644 -D lib/svnkit-${pkgver}.jar ${pkgdir}/usr/share/java/svnkit/svnkit.jar
}

