# Maintainer: tee < teeaur at duck dot com >
pkgname=sqinn-bin
pkgver=2.0.9
pkgrel=1
pkgdesc='SQLite over stdin/stdout'
arch=(x86_64)
url="https://github.com/cvilsmeier/sqinn"
license=(MIT)
provides=(sqinn)
conflicts=(sqinn)
source_x86_64=("sqinn-$pkgver-$CARCH.zip::$url/releases/download/v$pkgver/dist-linux-amd64.zip")
sha256sums_x86_64=('f91712eeaea68cb231aae512376c583e8bba0dd7ec16e46085ccde2d3188f091')

package() {
  install -Dm755 sqinn -t "$pkgdir/usr/bin"
}
