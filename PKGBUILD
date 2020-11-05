# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=cloud-sql-proxy-bin
pkgdesc="Google Cloud SQL proxy client"
pkgver=1.18.0
pkgrel=2
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
sha256sums_i686=('40f09c5b729ad0f0deced9713996f6c0b6504c37c9e2114fd3d2aca47ae9a085')
sha256sums_x86_64=('5d233e65c60201982b37e34cc3d0f8d4d4f654fdc82c0af606113af939d8dd95')
sha512sums_i686=('0f8404de0ad47683a271082b246abd49c6a396d9aa744249ac9166e8d38ee7d652597564a583fc6b3eaee5fd1a450430383e20111007204d88cddd2b1c6c938c')
sha512sums_x86_64=('7d5fa3b06d68694fe92ae9c62e6e23077edc6ecbade91dcaae01ef036363f98f2017bc67b4f6646f11655eb2a138dd0f9ae5e9b33b77139eff1297f626fc3b3c')
