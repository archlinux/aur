# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgbase=sqldef-bin
groups=('sqldef-bin')
pkgname=(
  mysqldef-bin
  sqlite3def-bin
  mssqldef-bin
  psqldef-bin
)
pkgver=3.11.16
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
sha256sums_x86_64=('65fc9aa685aafa57d1809adfebb25a4749069841f5f84fe77c7e6dedefdb5211'
                   '0c929f84614e7083bac600346d1fdba295d272f16d61000d603b1310f99d7810'
                   'eca904786a969a16d785cce6d8bb2ea2ad49d084c7ac2d3457f998ce7effc895'
                   '43f9fea01b19db3fbba7e3da8b8fefe4ac3846116a82a3739bd65de9edf620f0')
sha256sums_aarch64=('400e61371eaf77f1cf2f5d9012fa9ee3fd4b3dc9e9355349e2a852f107a1e2b4'
                    '88c6ddad9432aa2c7de448dfe5d0f327cff32530debd475f5de32386dd0bda21'
                    'ea0433b59a8154f439d34a2a95602a047589a239693333028d44df5f972a6d9f'
                    '3268fc4f78351bc5df13f87f38cf51c24053405ab6757f6aa8f064c273fc131d')

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
