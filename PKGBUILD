# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=usql-bin
pkgver=0.21.0
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
sha256sums_x86_64=('776afdcf83c5c66c51009e23bec1df7469c61dddbdcfe8265547a924b019c453')
sha256sums_armv6h=('e2a726ba7b747d0fc3ad235faf83e69f0d5cf74d5fc572fb991742a8943ba8e2')
sha256sums_armv7h=('e2a726ba7b747d0fc3ad235faf83e69f0d5cf74d5fc572fb991742a8943ba8e2')
sha256sums_aarch64=('cb30762e8b858ee955bdf42ac77cd40242531feb72f487da69fa23bb90e2a607')

package() {
    install -Dm755 usql -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
