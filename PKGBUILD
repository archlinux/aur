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
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/usr/share/java/${pkgname}"
  cp lib/*.jar "$pkgdir/usr/share/java/${pkgname}"
  chmod +r "$pkgdir/usr/share/java/${pkgname}"/*.jar
}

sha256sums=('06acb2fd2e45e80d67d9c04dc38e9694d9d7d3acbbe9e3bd3813153da38c4205')
