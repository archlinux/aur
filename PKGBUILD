# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=ydb
pkgver=2.7.0
pkgrel=1
pkgdesc="Yandex Database CLI"
license=('unknown')
arch=("x86_64")
url="https://ydb.tech/en/docs/reference/ydb-cli/"
source=("$pkgname-$pkgver"::"https://storage.yandexcloud.net/yandexcloud-ydb/release/${pkgver}/linux/amd64/ydb")
sha256sums=('b560f2958aa02fc414e7722d18cb737cca6bb74bcfb79e917fb1c5ebe12be0f4')

package() {
  cd "${srcdir}"
  install -D -m 0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/ydb"
}
