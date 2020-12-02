# Maintainer: robertfoster

pkgname=apache-mime4j
pkgver=0.8.3
pkgrel=1
pkgdesc="Apache JAMES Mime4j"
arch=('i686' 'x86_64')
url="http://james.apache.org/"
license=("Apache")
depends=('java-runtime')
source=("https://downloads.apache.org/james/mime4j/${pkgver}/${pkgname}-${pkgver}-bin.tar.gz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"/lib
  mkdir -p ${pkgdir}/usr/share/java/${pkgname}
  chmod +r *.jar
  cp *.jar $pkgdir/usr/share/java/${pkgname}
}

md5sums=('ba4a77bb6c66292a5eadfb82c2c46f2c')
