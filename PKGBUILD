# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=trino-cli-bin
pkgver=483
pkgrel=1
pkgdesc='Distributed SQL Query Engine for Big Data - Client'
arch=('any')
url='https://trino.io/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://github.com/trinodb/trino/releases/download/${pkgver}/trino-cli-${pkgver}")
noextract=("trino-cli-${pkgver}")
sha256sums=('182a1daca97bd14e7aa9b25cb62c6d0fd96fa80313e5431ac91da3184cebb601')

package() {
  cd "${srcdir}"

  install -D -m755 "trino-cli-${pkgver}" "${pkgdir}/usr/bin/trino"
}
