# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=presto-cli
pkgver=350
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://prestosql.io/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://repo1.maven.org/maven2/io/prestosql/presto-cli/${pkgver}/presto-cli-${pkgver}-executable.jar")
noextract=("presto-cli-${pkgver}-executable.jar")
sha256sums=('483c377fcebf2015e24d49df5da9a6b847217a955b1a74c297fc40eab9c46b17')

package() {
  cd "${srcdir}"
  install -D -m755 "presto-cli-${pkgver}-executable.jar" "${pkgdir}/usr/bin/presto"
}
