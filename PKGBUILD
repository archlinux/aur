# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=ydb
pkgver=2.26.0
pkgrel=1
pkgdesc="Yandex Database CLI"
license=('unknown')
arch=("x86_64")
url="https://ydb.tech/en/docs/reference/ydb-cli/"
source=("$pkgname-$pkgver"::"https://storage.yandexcloud.net/yandexcloud-ydb/release/${pkgver}/linux/amd64/ydb")
sha256sums=('d959a0c852c677029c2c548c1de65cd22e943fa259b9996a949e876e7bfebf39')

package() {
  cd "${srcdir}"
  install -D -m 0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/ydb"
}
