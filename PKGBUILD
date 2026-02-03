# Maintainer: tee < teeaur at duck dot com >
pkgname=sqinn-bin
pkgver=2.0.2
pkgrel=1
pkgdesc='SQLite over stdin/stdout'
arch=(x86_64)
url="https://github.com/cvilsmeier/sqinn"
license=(MIT)
provides=('sqinn')
conflicts=('sqinn')
source_x86_64=("sqinn-$pkgver-$CARCH.zip::$url/releases/download/v$pkgver/dist-linux-amd64.zip")
sha256sums_x86_64=('10ed034a848f8aa8e0a8838db45ee18630913e1210edba3393745ee895f0bf0d')

package() {
    install -Dm755 sqinn -t "$pkgdir/usr/bin"
}
