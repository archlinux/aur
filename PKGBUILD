# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgbase=sqldef-bin
groups=('sqldef-bin')
pkgname=(
  mysqldef-bin
  sqlite3def-bin
  mssqldef-bin
  psqldef-bin
)
pkgver=3.11.17
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
sha256sums_x86_64=('ba7eb24c18417f8e3f97a7d3deae07e9b89ea058933500291392c88e22acd469'
                   'cc35b792cf6f75371cdfb73a31a6410b8cd1580129b20a83ae00ce108e1d6936'
                   '1762b887a6cc0ba810858844a98b7cc284d35246d58e590d2afc7bba7c10d9db'
                   '5c6360b624f91b8684d7be4a19f14d37d16aad5cc07ddffe6b774ca9a7569027')
sha256sums_aarch64=('063d569b883f5f003d978389bef3cfb667901889fc3307137141992e4755c3eb'
                    '15f1ed57f75682f6e3f2d3c70b2c4c70d518360f426bf7be46484b7cecf57b9f'
                    '4bb6d864e228c92af05f689568ad2ed1d7acd9fa0cc3e0e2807f52bf65a63c7c'
                    'c576a51b0c6bc0d19b0dbcef791b982e3b723de383c887b8f0fc6245be9057ba')

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
