# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=ydb
pkgver=1.2.1
pkgrel=1
pkgdesc="Yandex Database CLI"
license=('unknown')
arch=("x86_64")
url="https://cloud.yandex.ru/docs/ydb/quickstart/examples-ydb-cli"
source=("https://storage.yandexcloud.net/yandexcloud-ydb/release/${pkgver}/linux/amd64/ydb")
sha256sums=('e64c57fc15c5c500cb6cb9da78ac7d34089ebf64d217fcf33801936488ce2e4c')

package() {
  cd "${srcdir}"
  install -D -m 0755 ydb "$pkgdir/usr/bin/ydb"
}
