# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=elasticmq
pkgver=1.6.8
pkgrel=1
pkgdesc="Amazon SQS compatible in-memory message queue"
arch=('any')
url="https://github.com/softwaremill/elasticmq"
license=("Apache-2.0")
depends=("java-runtime-headless")
source=("https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${pkgver}.jar")
noextract=("elasticmq-server-${pkgver}.jar")
sha256sums=('b7468b50962e2a2d7d37888f32fc3bd8e2e021cd6cb5eaa75106e2d3117aaefe')

package() {
  cd "${srcdir}"
  install -D -m755 "elasticmq-server-${pkgver}.jar" "${pkgdir}/usr/bin/elasticmq"
}
