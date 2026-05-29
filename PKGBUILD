# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=trino-cli-bin
pkgver=481
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://trino.io/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://github.com/trinodb/trino/releases/download/481/trino-cli-${pkgver}")
noextract=("trino-cli-${pkgver}")
sha256sums=('9532fb7a47dc54eec4041e86d980991236c131fd6e34983e40f735ccf60bad7f')

package() {
  cd "${srcdir}"

  install -D -m755 "trino-cli-${pkgver}" "${pkgdir}/usr/bin/trino"
}
