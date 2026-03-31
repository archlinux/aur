# Maintainer: tee < teeaur at duck dot com >
pkgname=sqinn-bin
pkgver=2.0.3
pkgrel=1
pkgdesc='SQLite over stdin/stdout'
arch=(x86_64)
url="https://github.com/cvilsmeier/sqinn"
license=(MIT)
provides=('sqinn')
conflicts=('sqinn')
source_x86_64=("sqinn-$pkgver-$CARCH.zip::$url/releases/download/v$pkgver/dist-linux-amd64.zip")
sha256sums_x86_64=('9c7c8b0d2d72a31478f896764ed7d2787db9c6700e794852b37c225e723df4b7')

package() {
    install -Dm755 sqinn -t "$pkgdir/usr/bin"
}
