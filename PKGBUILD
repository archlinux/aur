# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=cloud-sql-proxy-bin
pkgdesc="Google Cloud SQL proxy client"
pkgver=1.28.0
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'arm64')
url="https://github.com/GoogleCloudPlatform/cloudsql-proxy"
license=('Apache')
provides=('cloud-sql-proxy=$pkgver')
_bin_file=cloud_sql_proxy-$pkgver
source_i686=($_bin_file-i686::https://storage.googleapis.com/cloudsql-proxy/v$pkgver/cloud_sql_proxy.linux.386)
source_x86_64=($_bin_file-x86_64::https://storage.googleapis.com/cloudsql-proxy/v$pkgver/cloud_sql_proxy.linux.amd64)
source_arm=($_bin_file-arm::https://storage.googleapis.com/cloudsql-proxy/v$pkgver/cloud_sql_proxy.linux.arm)
source_arm_64=($_bin_file-arm_64::https://storage.googleapis.com/cloudsql-proxy/v$pkgver/cloud_sql_proxy.linux.arm64)

package() {
  install -Dm755 "$srcdir/$_bin_file-$CARCH" "$pkgdir/usr/bin/cloud_sql_proxy"
}

sha256sums_i686=('8d13445477aff16f400832c17786c5daf785b1bd3b73eafa1b2145cf0b6345ab')
sha256sums_x86_64=('f86d58ddab285238c84d1d0463a9ea5dc6047af9f439c0852ef9d31ac31514d0')
sha256sums_arm=('3b0d150f0473aff437464fd0e0bbaafa0533f552704039fb2ec77d3a09950d51')
sha256sums_arm_64=('a58a8dfeebdbb4bc068af0f3ddd26acc2827e89a4ab20644178a2ad34d2c5a1e')
