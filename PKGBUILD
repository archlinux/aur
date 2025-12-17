# Maintainer: pili <contact@ayopili.com>

pkgname=spotify-history-analyzer
pkgver=1.0.0
pkgrel=1
pkgdesc="Analyze Spotify history and generate statistics"
arch=('any')
url="https://github.com/Piliii/spotify-history-analyzer"
license=('MIT')
depends=('python')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 spotify-history-analyzer \
        "$pkgdir/usr/bin/spotify-history-analyzer"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}