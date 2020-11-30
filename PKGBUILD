# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=cloud-sql-proxy-bin
pkgdesc="Google Cloud SQL proxy client"
pkgver=1.19.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/GoogleCloudPlatform/cloudsql-proxy"
license=('Apache')
provides=('cloud-sql-proxy=$pkgver')
_bin_file=cloud_sql_proxy-$pkgver
source_i686=($_bin_file-i686::https://storage.googleapis.com/cloudsql-proxy/v$pkgver/cloud_sql_proxy.linux.386)
source_x86_64=($_bin_file-x86_64::https://storage.googleapis.com/cloudsql-proxy/v$pkgver/cloud_sql_proxy.linux.amd64)

package() {
  install -Dm755 "$srcdir/$_bin_file-$CARCH" "$pkgdir/usr/bin/cloud_sql_proxy"
}
sha256sums_i686=('78e288a210ee1e61bea3a9b8fc28b8020f336a05058accb2917abead05779193')
sha256sums_x86_64=('8785505a653471295378ee4eab266487f629ad0c08f793db55046705bb9dc7b6')
sha512sums_i686=('f5b133a9ae9b4aa9b727088ef735b3f1f1195e09afe1a077fb53eb61b6adc6b531cbaf0123c02ce91f92abb71bab82ab48bd2ba22098fb9c2576e1890f740d66')
sha512sums_x86_64=('e5a143e9b1a80eb7b7d15934db841e4cdea2b5ac00c5a593cee753eb7afc605526e541eebe760bbdc84acb5e95a3394b90901fc6232dd0fa61fecc27e97bed47')
