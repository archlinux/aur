# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=presto-cli
pkgver=332
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://prestosql.io/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://repo1.maven.org/maven2/io/prestosql/presto-cli/${pkgver}/presto-cli-${pkgver}-executable.jar")
noextract=("presto-cli-${pkgver}-executable.jar")
sha256sums=('38b2253e1c33353ff6fe66d6f4c9b07ff7667b9288642775502878274c8f8e2c')

package() {
  cd "${srcdir}"
  install -D -m755 "presto-cli-${pkgver}-executable.jar" "${pkgdir}/usr/bin/presto"
}
