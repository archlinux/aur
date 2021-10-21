# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=elasticmq
pkgver=1.3.1
pkgrel=1
pkgdesc="Amazon SQS compatible in-memory message queue"
arch=('any')
url="https://github.com/softwaremill/elasticmq"
license=("Apache")
depends=("java-runtime-headless")
source=("https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${pkgver}.jar")
noextract=("elasticmq-server-${pkgver}.jar")
sha256sums=('dae5da4437c9b545b3b579f195a7c05a9e7fe85220787f7e2fb8f9cf505eee9a')

package() {
  cd "${srcdir}"
  install -D -m755 "elasticmq-server-${pkgver}.jar" "${pkgdir}/usr/bin/elasticmq"
}
