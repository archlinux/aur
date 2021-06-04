# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=elasticmq
pkgver=1.1.1
pkgrel=1
pkgdesc="Amazon SQS compatible in-memory message queue"
arch=('any')
url="https://github.com/softwaremill/elasticmq"
license=("Apache")
depends=("java-runtime-headless")
source=("https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${pkgver}.jar")
noextract=("elasticmq-server-${pkgver}.jar")
sha256sums=('e5975d633cdd10f869e192654f929cd5b7352d5dd4acf5eedb7cf5b8fe3ca011')

package() {
  cd "${srcdir}"
  install -D -m755 "elasticmq-server-${pkgver}.jar" "${pkgdir}/usr/bin/elasticmq"
}
