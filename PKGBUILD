# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=ydb
pkgver=1.4.0
pkgrel=1
pkgdesc="Yandex Database CLI"
license=('unknown')
arch=("x86_64")
url="https://cloud.yandex.com/en/docs/ydb/quickstart/examples-ydb-cli"
source=("https://storage.yandexcloud.net/yandexcloud-ydb/release/${pkgver}/linux/amd64/ydb")
sha256sums=('0ba870e33572d9dda7b8585ddb77bb84487cea0b85e7620bf7a98e277d37e855')

package() {
  cd "${srcdir}"
  install -D -m 0755 ydb "$pkgdir/usr/bin/ydb"
}
