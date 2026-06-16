# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgbase=sqldef-bin
groups=('sqldef-bin')
pkgname=(
  mysqldef-bin
  sqlite3def-bin
  mssqldef-bin
  psqldef-bin
)
pkgver=3.11.6
pkgrel=1
pkgdesc='Idempotent schema management for MySQL, PostgreSQL, SQLite, and SQL Server'
arch=(x86_64 aarch64)
url='https://github.com/sqldef/sqldef'
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=('MIT')
provides=("${pkgbase%-bin}")
conflicts=("${pkgbase%-bin}")

source=("LICENSE_$pkgver::$_rawurl/LICENSE")

source_aarch64=(
  "${pkgname[0]}-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${pkgname[0]%-bin}_linux_arm64.tar.gz"
  "${pkgname[1]}-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${pkgname[1]%-bin}_linux_arm64.tar.gz"
  "${pkgname[2]}-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${pkgname[2]%-bin}_linux_arm64.tar.gz"
  "${pkgname[3]}-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${pkgname[3]%-bin}_linux_arm64.tar.gz"
)

source_x86_64=(
  "${pkgname[0]}-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${pkgname[0]%-bin}_linux_amd64.tar.gz"
  "${pkgname[1]}-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${pkgname[1]%-bin}_linux_amd64.tar.gz"
  "${pkgname[2]}-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${pkgname[2]%-bin}_linux_amd64.tar.gz"
  "${pkgname[3]}-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${pkgname[3]%-bin}_linux_amd64.tar.gz"
)

sha256sums=('c31299e97dde871d8a3c717f73fbb812a5cc25f4a089e4abc4bcc490eb13cfb1')
sha256sums_x86_64=('6c8b0b78cf184e6090ecaca2227acd5f6c986b13b53db5d3cada02086c8bfff5'
                   '36358a98af70de8296002076741b26bc2d91cdc739247d5fa3090d032f3ea224'
                   '5eadf8559b9e184d01d47d3a4fe62f3b7694bc782ef0ab64aa6ada9ce3d41a07'
                   '6d11a8e9c9e8f5b9e865dbc1211c2dbb2f389b895e8980b354d5b1daee107742')
sha256sums_aarch64=('02875f6d9fadac152d73e1fe5b187be23b5ccd3c5463610658b866358cc839f2'
                    'eb5f5f45d5b9b9f58b0dded9f2527659afc8d294aaea43bd38046600b9f6ea36'
                    'b52f2bf6bbb48f9abbb4713adc0c6b281611e5c52c29188498b5f2f2ddbf818e'
                    'db18aa06801ecc8dc3ed32c72ec32c5ebe8805a98ca01c02f094883da306e8b8')

package_mysqldef-bin() {
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_sqlite3def-bin() {
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mssqldef-bin() {
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_psqldef-bin() {
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_$pkgver -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
