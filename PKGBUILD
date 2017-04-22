pkgname=svnkit
pkgver=1.8.15
pkgrel=1
pkgdesc="A Subversion library for Java"
arch=('any')
url="http://svnkit.com"
license=('custom')
depends=('java-runtime')
source=(http://svnkit.com/org.tmatesoft.svn_${pkgver}.standalone.zip)
sha512sums=('1447c90c94896dd2f226c75904e7a96a5971c71872593e8d56183f38143ac60ed7c716a27657eef90d1d8b41850991b0daf6217ab36cc68efa06d69321c123e2')

build(){
  true
}

package() {
  cd $srcdir/svnkit-${pkgver}*
  install -m644 -D lib/svnkit-${pkgver}.jar ${pkgdir}/usr/share/java/svnkit/svnkit.jar
}

