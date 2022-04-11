# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=trino-cli-bin
pkgver=376
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://trino.io/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://repo1.maven.org/maven2/io/trino/trino-cli/${pkgver}/trino-cli-${pkgver}-executable.jar")
noextract=("trino-cli-${pkgver}-executable.jar")
sha256sums=('b54cf259354ba9fad2def1d4b1be7da0c0eabd8e9eb33e1e0adbdd9d32721a47')

package() {
  cd "${srcdir}"
  install -D -m755 "trino-cli-${pkgver}-executable.jar" "${pkgdir}/usr/bin/trino"
}
