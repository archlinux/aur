# Maintainer: tarball <bootctl@gmail.com>

pkgname=goread-bin
pkgver=1.6.5
pkgrel=1
pkgdesc='Read RSS/Atom feeds right in the terminal'
url='https://github.com/TypicalAM/goread'
arch=(i686 x86_64 aarch64)
license=(GPL-3.0-only)
provides=(goread)
conflicts=(goread)

_base_url="$url/releases/download/v$pkgver/goread_Linux_"

source_i686=("$pkgname-$pkgver-i686::${_base_url}i386")
source_x86_64=($pkgname-$pkgver-x86_64::"${_base_url}x86_64")
source_aarch64=($pkgname-$pkgver-aarch64::"${_base_url}arm64")

sha256sums_i686=('7a4b0ab17fb3e8c5c2b0afdbef04c0a1e0ce51fc7925f0adbf9e3dd0d1646eee')
sha256sums_x86_64=('8921b4bb2cdb0cc339699bedf477749b1e8e246b53e38e3007e27817c5dd2a2c')
sha256sums_aarch64=('6d92e32cd3fc93b7a765a9ea075c5b8d7c51aeb87227dae3c88a3c1c770ad6e9')

noextract=(
  "$pkgname-$pkgver-i686"
  "$pkgname-$pkgver-x86_64"
  "$pkgname-$pkgver-aarch64"
)

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/goread"
}
