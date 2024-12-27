# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=ydb
pkgver=2.18.0
pkgrel=1
pkgdesc="Yandex Database CLI"
license=('unknown')
arch=("x86_64")
url="https://ydb.tech/en/docs/reference/ydb-cli/"
source=("$pkgname-$pkgver"::"https://storage.yandexcloud.net/yandexcloud-ydb/release/${pkgver}/linux/amd64/ydb")
sha256sums=('08dc4cd8991fa1f521b749b911f924db1a7583f72e84c075356bb3249bc40c92')

package() {
  cd "${srcdir}"
  install -D -m 0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/ydb"
}
