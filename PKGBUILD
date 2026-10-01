# Maintainer: robertfoster

pkgname=apache-mime4j
pkgver=0.8.15 # renovate: datasource=maven depName=org.apache.james:apache-mime4j-core
pkgrel=1
pkgdesc="Apache JAMES Mime4j"
arch=('x86_64')
url="http://james.apache.org/"
license=('Apache-2.0')
depends=('java-runtime')
source=("https://www.apache.org/dyn/closer.lua/james/mime4j/${pkgver}/${pkgname}-core-${pkgver}.jar")

package() {
  install -Dm755 ${pkgname}-core-${pkgver}.jar \
    -t "${pkgdir}/usr/share/java/${pkgname}"
}

sha256sums=('96919d5180985a92350943be0854307abc0349ad8276eff5cdf05331794035c1')
