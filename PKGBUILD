# Maintainer: tee < teeaur at duck dot com >
pkgname=sqinn-bin
pkgver=2.0.4
pkgrel=1
pkgdesc='SQLite over stdin/stdout'
arch=(x86_64)
url="https://github.com/cvilsmeier/sqinn"
license=(MIT)
provides=(sqinn)
conflicts=(sqinn)
source_x86_64=("sqinn-$pkgver-$CARCH.zip::$url/releases/download/v$pkgver/dist-linux-amd64.zip")
sha256sums_x86_64=('3242d4cf3e0e1321635777170a29c586aa5e5c340aa94214baee6bc9b15215ff')

package() {
  install -Dm755 sqinn -t "$pkgdir/usr/bin"
}
