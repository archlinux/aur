# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=ydb
pkgver=1.6.0
pkgrel=1
pkgdesc="Yandex Database CLI"
license=('unknown')
arch=("x86_64")
url="https://cloud.yandex.com/en/docs/ydb/quickstart/examples-ydb-cli"
source=("https://storage.yandexcloud.net/yandexcloud-ydb/release/${pkgver}/linux/amd64/ydb")
sha256sums=('698cb1717891626986e97e43ad7d853c4852b813718e022d635e8e68daab1937')

package() {
  cd "${srcdir}"
  install -D -m 0755 ydb "$pkgdir/usr/bin/ydb"
}
