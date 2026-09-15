# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgbase=sqldef-bin
groups=('sqldef-bin')
pkgname=(
  mysqldef-bin
  sqlite3def-bin
  mssqldef-bin
  psqldef-bin
)
pkgver=3.11.21
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
sha256sums_x86_64=('c11ba03094e201317c122ae152640fa24c6dcf6a76e4c2ef64dd4bf0b64df322'
                   '1cb729ae5609dfb2c7bf157740c64f8b4971c33f644ffe42a171cfb8407ff089'
                   '9decf8f778f32114b2810b350d067b012eafc63a01e0788f32fc1b9cc91c401f'
                   '98c78e48c4688e5e11c34c8c17748147093e691828c51bf153527ff71998dcab')
sha256sums_aarch64=('9ff83f556e684e72381e849fa11fec263728aec4b2f70c18cd3a784b38f44dbd'
                    '3743d09d4b5abfa3ed662a40c8810f56ad4221d798cb7b4f932c3fdce4ff0172'
                    '53fd461338c0f77ddabca05ef234fe4d9a6714c889796f638c7caa621a199014'
                    '74132d321e2a19d8e1ab3c103eda631abf314770ba87c9dfc0acf2c994c39bfc')

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
