# Maintainer: Sqrilizz <https://github.com/Sqrilizz>

pkgname=ffind-rs-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="High-performance, multi-threaded file finder for Linux with gitignore support and fuzzy matching (prebuilt binary)"
arch=(x86_64)
url="https://github.com/Sqrilizz/ffind"
license=(MIT)
provides=(ffind)
conflicts=(ffind ffind-rs)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/ffind-v$pkgver-x86_64-linux-musl.tar.gz")
sha256sums=("2b957b58662cbdfc294f04feb8d11502da578cc812382a02ea25f0c4f162873d")

package() {
  cd "$srcdir/ffind-v$pkgver-x86_64-linux-musl"
  install -Dm 755 ffind -t "$pkgdir/usr/bin"
}
