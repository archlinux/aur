# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=trino-cli-bin
pkgver=375
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://trino.io/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://repo1.maven.org/maven2/io/trino/trino-cli/${pkgver}/trino-cli-${pkgver}-executable.jar")
noextract=("trino-cli-${pkgver}-executable.jar")
sha256sums=('0b96af66dca43353389be3c348f0472a9e709ace22c9a2a9689acb64b70beac1')

package() {
  cd "${srcdir}"
  install -D -m755 "trino-cli-${pkgver}-executable.jar" "${pkgdir}/usr/bin/trino"
}
