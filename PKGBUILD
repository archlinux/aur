# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=ydb
pkgver=1.5.0
pkgrel=1
pkgdesc="Yandex Database CLI"
license=('unknown')
arch=("x86_64")
url="https://cloud.yandex.com/en/docs/ydb/quickstart/examples-ydb-cli"
source=("https://storage.yandexcloud.net/yandexcloud-ydb/release/${pkgver}/linux/amd64/ydb")
sha256sums=('764306ef11e3e568a4663644d0ae0aeab695feaa51b1ef4eaaa4b4dbc18944d2')

package() {
  cd "${srcdir}"
  install -D -m 0755 ydb "$pkgdir/usr/bin/ydb"
}
