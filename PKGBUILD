# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=ydb
pkgver=1.3.3
pkgrel=1
pkgdesc="Yandex Database CLI"
license=('unknown')
arch=("x86_64")
url="https://cloud.yandex.com/en/docs/ydb/quickstart/examples-ydb-cli"
source=("https://storage.yandexcloud.net/yandexcloud-ydb/release/${pkgver}/linux/amd64/ydb")
sha256sums=('49e26bcaad44a2f0494d35d99c3b4eb78db23bd0e3374a676b5b506798de8253')

package() {
  cd "${srcdir}"
  install -D -m 0755 ydb "$pkgdir/usr/bin/ydb"
}
