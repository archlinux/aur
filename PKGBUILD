# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=ydb
pkgver=2.3.0
pkgrel=1
pkgdesc="Yandex Database CLI"
license=('unknown')
arch=("x86_64")
url="https://cloud.yandex.com/en/docs/ydb/quickstart/examples-ydb-cli"
source=("$pkgname-$pkgver"::"https://storage.yandexcloud.net/yandexcloud-ydb/release/${pkgver}/linux/amd64/ydb")
sha256sums=('6eef3b1e929a7b5c3fa57eae41a845538bb7bd97c27c36cebb9bd00de9e2bdbc')

package() {
  cd "${srcdir}"
  install -D -m 0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/ydb"
}
