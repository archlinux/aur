# Maintainer: tee < teeaur at duck dot com >
pkgname=sqinn-bin
pkgver=2.0.5
pkgrel=1
pkgdesc='SQLite over stdin/stdout'
arch=(x86_64)
url="https://github.com/cvilsmeier/sqinn"
license=(MIT)
provides=(sqinn)
conflicts=(sqinn)
source_x86_64=("sqinn-$pkgver-$CARCH.zip::$url/releases/download/v$pkgver/dist-linux-amd64.zip")
sha256sums_x86_64=('c452cb153dabaf55d4046e88c03cc3f17ee01d6a8426555c6e9b87f414656bdc')

package() {
  install -Dm755 sqinn -t "$pkgdir/usr/bin"
}
