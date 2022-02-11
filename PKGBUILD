# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=trino-cli-bin
pkgver=370
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://trino.io/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://repo1.maven.org/maven2/io/trino/trino-cli/${pkgver}/trino-cli-${pkgver}-executable.jar")
noextract=("trino-cli-${pkgver}-executable.jar")
sha256sums=('9e8b66175b9716ca942ac63b24f62ebdcc7d47e1b39a0b5c124c89db31c2b9b4')

package() {
  cd "${srcdir}"
  install -D -m755 "trino-cli-${pkgver}-executable.jar" "${pkgdir}/usr/bin/trino"
}
