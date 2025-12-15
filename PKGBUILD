# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=feroxbuster-bin
pkgver=2.13.1
pkgrel=1
pkgdesc="A fast, simple, recursive content discovery tool written in Rust"
url="https://github.com/epi052/feroxbuster"
license=("MIT")
arch=("x86_64")
depends=()
provides=("feroxbuster")
conflicts=("feroxbuster" "feroxbuster-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/epi052/feroxbuster/releases/download/v$pkgver/x86_64-linux-feroxbuster.tar.gz")
b2sums=('dfb92d4128838c977b86886dd5dfa4240d14bb25c233f2d1e05e8ab2c9ec8adff0d4614a0601cb725a6e3f715f4d8d378b7d3a39254de9fba14c56955971284d')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/feroxbuster"
}
