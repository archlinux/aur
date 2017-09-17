# Maintainer: Jamie McClymont <jamie.mcclymont@gmail.com>
# Yawn is by Expenses <expenses@airmail.cc>
pkgname=yawn
pkgver=0.1.0
pkgrel=1
pkgdesc="A command-line rss feed downloader thing"
url="https://github.com/expenses/yawn"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('rust' 'cargo' 'git')
license=('unknown')
source=("git+https://github.com/expenses/yawn.git")
md5sums=('SKIP')


build() {
    cd yawn
    cargo build --release
}

package() {
    cd yawn
    cargo install --root="$pkgdir"
    rm "$pkgdir"
}
