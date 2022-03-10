# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=trino-cli-bin
pkgver=373
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://trino.io/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://repo1.maven.org/maven2/io/trino/trino-cli/${pkgver}/trino-cli-${pkgver}-executable.jar")
noextract=("trino-cli-${pkgver}-executable.jar")
sha256sums=('4a2ec84185253b7238bb92515aba28869fe0a71190168734f41bb5e5b0c4c6ee')

package() {
  cd "${srcdir}"
  install -D -m755 "trino-cli-${pkgver}-executable.jar" "${pkgdir}/usr/bin/trino"
}
