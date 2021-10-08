# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=elasticmq
pkgver=1.2.3
pkgrel=1
pkgdesc="Amazon SQS compatible in-memory message queue"
arch=('any')
url="https://github.com/softwaremill/elasticmq"
license=("Apache")
depends=("java-runtime-headless")
source=("https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${pkgver}.jar")
noextract=("elasticmq-server-${pkgver}.jar")
sha256sums=('e8b54d699750c2c759f6c3651e6928e9258f60f659c5224c0ebbfe73da0457ba')

package() {
  cd "${srcdir}"
  install -D -m755 "elasticmq-server-${pkgver}.jar" "${pkgdir}/usr/bin/elasticmq"
}
