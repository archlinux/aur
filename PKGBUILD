# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgbase=sqldef-bin
groups=('sqldef-bin')
pkgname=(
  mysqldef-bin
  sqlite3def-bin
  mssqldef-bin
  psqldef-bin
)
pkgver=3.11.15
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
sha256sums_x86_64=('91fa8b928e80451f36e60e5f89f84e1c35b95b0138e095ee7c27afeb22c19542'
                   '2120c14d6809258e05cabe1bbc443da627ba260cd425e30b26a8e559ca19bae9'
                   '2a829bf63c5e41d726aee4b5998ad8b931f516b3a10f4656e7f4e39f0572616e'
                   'e2002885be27a322a79f8e66ddf27dd3827f0a97b5c841531f582bfa373a11e7')
sha256sums_aarch64=('c3a096294f9c2b01ad6ca88feaa250e181fa62ae3356137cf00da1b5e7a6fbdd'
                    'd38e4c44d663f76f6a0472247faa5011a998c2457206b8d5b783cf49d5bbf0a0'
                    '4e15e05a6a8bc1ec3112b5624cd49fe9b0f1283545f7b390d90827cb8e0ba097'
                    '2091beb61a88b8c1ad897e442b9b8870fad7f943da0c3c860b3cf5ba3836c462')

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
