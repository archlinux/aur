# Maintainer: Leontios Mavropalias <leonmavr755 [a t] protonmail [d o t] com>
# Contributor: Leontios Mavropalias <leonmavr755 [a t] protonmail [d o t] com>
pkgname=zeitkatze
pkgver=0.1.4
pkgrel=1
pkgdesc="Precise CLI stopwatch with cat ASCII art"
arch=("x86_64")
url="https://github.com/leonmavr/zeitkatze"
license=("MIT")
source=(https://github.com/leonmavr/$pkgname/archive/refs/tags/$pkgver.tar.gz)
sha512sums=("bc1d7520d9ab8f04a14cb1c6ea38dcdc338bfe6a71115b96a6f92ca226d57ce9811795d17d770119dd1a6f87b803cf6b3407cb0c0dd446ade11f63e1b33519fe")

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    # make install requires make
    make PREFIX="$pkgdir/usr" install
}

