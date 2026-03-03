# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=usql-bin
pkgver=0.21.1
pkgrel=1
pkgdesc='A universal command-line interface for SQL databases'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xo/usql"
license=(MIT)
provides=(usql)
conflicts=(usql)

source=("https://raw.githubusercontent.com/xo/usql/refs/tags/v$pkgver/README.md")
source_x86_64=("$url/releases/download/v$pkgver/usql-$pkgver-linux-amd64.tar.bz2")
source_armv6h=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm.tar.bz2")
source_armv7h=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm.tar.bz2")
source_aarch64=("$url/releases/download/v$pkgver/usql-$pkgver-linux-arm64.tar.bz2")

sha256sums=('aa6b75df1c4acc895646dfba859d93df9d5dbfec94eccbeae513ef93665d5780')
sha256sums_x86_64=('a2ff6402bd8ed68a842066a70610fad323530d091685ab28890e5e42bb296ff8')
sha256sums_armv6h=('ca94560c576b72f9473b220fbbe4001231fd4e134f79767ec44dbe2d23692080')
sha256sums_armv7h=('ca94560c576b72f9473b220fbbe4001231fd4e134f79767ec44dbe2d23692080')
sha256sums_aarch64=('0df1f17d5137ce78e70cebc2bbf3bdb34d9b1ad935b3106f749dfd7b2d807959')

package() {
    install -Dm755 usql -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
