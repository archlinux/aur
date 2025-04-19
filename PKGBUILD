# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=elasticmq
pkgver=1.6.12
pkgrel=1
pkgdesc="Amazon SQS compatible in-memory message queue"
arch=('any')
url="https://github.com/softwaremill/elasticmq"
license=("Apache-2.0")
depends=("java-runtime-headless")
source=("https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${pkgver}.jar")
noextract=("elasticmq-server-${pkgver}.jar")
sha256sums=('d737ec1fcd8108c0435b9fab5cc82c0b8a7a49fba06a4e56eddf33d713171bd7')

package() {
  cd "${srcdir}"
  install -D -m755 "elasticmq-server-${pkgver}.jar" "${pkgdir}/usr/bin/elasticmq"
}
