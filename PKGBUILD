# Maintainer: Bruce Hill <contact@bruce-hill.com>
pkgname=tomo
_tomo_version=2025-12-21.5
pkgver="${_tomo_version//-/_}"
pkgrel=1
pkgdesc='The Tomo programming language compiler'
arch=('x86_64' 'aarch64')
url="https://tomo.bruce-hill.com"
license=('custom')
depends=('gcc' 'binutils' 'gmp' 'libunistring' 'gc')
source=("https://github.com/bruce-hill/tomo/releases/download/v$_tomo_version/tomo-linux-$CARCH.tar.gz")
sha256sums=('d0852f62e97950b55c84c2f9d6e3ee91ce86e0c5ce70dc346a98d3c226c1156b')
package() {
    cd "$srcdir"
    mkdir "$pkgdir/usr"
    tar -xzf "tomo-linux-${CARCH}.tar.gz" -C "$pkgdir/usr" --strip-components=1
}
