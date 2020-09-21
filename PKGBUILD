# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=presto-cli
pkgver=341
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://prestosql.io/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://repo1.maven.org/maven2/io/prestosql/presto-cli/${pkgver}/presto-cli-${pkgver}-executable.jar")
noextract=("presto-cli-${pkgver}-executable.jar")
sha256sums=('63b97a01e18f2d8631bd6ec71c955eb372a9b221b64187716d99a57437b07935')

package() {
  cd "${srcdir}"
  install -D -m755 "presto-cli-${pkgver}-executable.jar" "${pkgdir}/usr/bin/presto"
}
