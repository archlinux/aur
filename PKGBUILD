# Contributor: Jan Was <janek.jan at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=usql-bin
pkgver=0.20.8
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
sha256sums_x86_64=('ba471bf26cfe1017601dabe1309be44f4a5fbda9c2ef49838473eb98cdd84100')
sha256sums_armv6h=('875a2e96465956fb964ae42f414d202dbff437f0d4fce47f22ff71b9ea3433e0')
sha256sums_armv7h=('875a2e96465956fb964ae42f414d202dbff437f0d4fce47f22ff71b9ea3433e0')
sha256sums_aarch64=('a853eff601d06e4a0339d30181560ce014ef4067dab1e12f104ec8caee1eddc0')

package() {
    install -Dm755 usql -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
