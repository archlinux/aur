# Maintainer: tee < teeaur at duck dot com >
pkgname=sqinn-bin
pkgver=2.0.7
pkgrel=1
pkgdesc='SQLite over stdin/stdout'
arch=(x86_64)
url="https://github.com/cvilsmeier/sqinn"
license=(MIT)
provides=(sqinn)
conflicts=(sqinn)
source_x86_64=("sqinn-$pkgver-$CARCH.zip::$url/releases/download/v$pkgver/dist-linux-amd64.zip")
sha256sums_x86_64=('080600e6b8d1d31c18b26edc97e876f9c2781c6a8cd9bfee6972a1f487dab510')

package() {
  install -Dm755 sqinn -t "$pkgdir/usr/bin"
}
