# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=ydb
pkgver=2.11.0
pkgrel=1
pkgdesc="Yandex Database CLI"
license=('unknown')
arch=("x86_64")
url="https://ydb.tech/en/docs/reference/ydb-cli/"
source=("$pkgname-$pkgver"::"https://storage.yandexcloud.net/yandexcloud-ydb/release/${pkgver}/linux/amd64/ydb")
sha256sums=('5671c625fac9fa1cb7f2edad8470aa437858f964bf78d74d4edda6b1ab21dea9')

package() {
  cd "${srcdir}"
  install -D -m 0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/ydb"
}
