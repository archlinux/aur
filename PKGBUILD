# Maintainer: robertfoster

pkgname=apache-mime4j
pkgver=0.8.12
pkgrel=1
pkgdesc="Apache JAMES Mime4j"
arch=('i686' 'x86_64')
url="http://james.apache.org/"
license=("Apache")
depends=('java-runtime')
source=("https://www.apache.org/dyn/closer.lua/james/mime4j/${pkgver}/${pkgname}-core-${pkgver}.jar")

package() {
  install -Dm755 ${pkgname}-core-${pkgver}.jar \
   -t "${pkgdir}/usr/share/java/${pkgname}"
}

sha256sums=('f907a117b3237d92077b97a98da0fc232661eb38376ce23f73a09d7fae1953f5')
