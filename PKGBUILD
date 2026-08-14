# Maintainer: Marvin Zhang <marvin.beeblebrox@gmail.com>
pkgname=z85-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A base64-compatible Z85 CLI tool written in Rust (pre-built binary)"
arch=(x86_64)
url="https://github.com/nirvam/z85"
license=(MIT)
depends=(gcc-libs)
provides=(z85)
conflicts=(z85)
options=(!debug)
source_x86_64=("$pkgname-$pkgver-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver/z85-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=(28b0dfb5253913a40b9b2b43835268a23ce4a2eae06b47a2e39061100dfd7e22)

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
