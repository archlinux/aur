# Maintainer: tee < teeaur at duck dot com >
pkgname=sqinn-bin
pkgver=2.0.6
pkgrel=1
pkgdesc='SQLite over stdin/stdout'
arch=(x86_64)
url="https://github.com/cvilsmeier/sqinn"
license=(MIT)
provides=(sqinn)
conflicts=(sqinn)
source_x86_64=("sqinn-$pkgver-$CARCH.zip::$url/releases/download/v$pkgver/dist-linux-amd64.zip")
sha256sums_x86_64=('ae8b6f95135143fcace8173532d4430a9d804c2b05b5295040fe9939c2e30815')

package() {
  install -Dm755 sqinn -t "$pkgdir/usr/bin"
}
