# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=m3u8-downloader
pkgver=nightly
pkgrel=1
pkgdesc="m3u8-downloader"
arch=('x86_64')
url="https://github.com/someoneonsmile/m3u8-downloader"
license=('GPL2')
# depends=('gcc-libs')
makedepends=()
conflicts=()
source=("${pkgname}.tar.gz::https://github.com/someoneonsmile/m3u8-downloader/releases/download/nightly/m3u8-downloader-nightly-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('SKIP')

pkgver() {
  printf "nightly"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "*/m3u8-downloader" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "*/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
