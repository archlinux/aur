# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=cloud-sql-proxy-bin
pkgdesc="Google Cloud SQL proxy client"
pkgver=1.27.0
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

sha256sums_i686=('d37fb716dcda8f4872ffec9ee140878dd23aeac29f72ba157afcb3245a06b1c8  ')
sha256sums_x86_64=('80934dfd7fd4097e2782be51d21c6e7d3d99327fb4e2fee3a151f4990809f63f')
sha256sums_arm=('a241fa03a7ccee0e096e77931cc369175390105c5ef98a4f679c8f8448c7b26a')
sha256sums_arm_64=('e6a1e1c740511a791341119cc6ff89f992f05d0e5019ca02000703b5667d8c9b')
