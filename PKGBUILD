# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=trino-cli-bin
pkgver=476
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://trino.io/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://repo1.maven.org/maven2/io/trino/trino-cli/${pkgver}/trino-cli-${pkgver}-executable.jar")
noextract=("trino-cli-${pkgver}-executable.jar")
sha256sums=('fe4e9c7fb569cd67673afa1622945f6308e1e59bdb825419352b80887661757b')

package() {
  cd "${srcdir}"

  install -D -m755 "trino-cli-${pkgver}-executable.jar" "${pkgdir}/usr/bin/trino"
}
