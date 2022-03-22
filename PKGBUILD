# Maintainer: Philipp Joram <mail at phijor dot me>

pkgname=pokefinder
pkgver=4.0.0
pkgrel=2
pkgdesc='Cross platform Pokémon RNG tool'
arch=(x86_64)
url='https://github.com/Admiral-Fish/PokeFinder'
license=('GPL3')
depends=(
    'qt6-base'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Admiral-Fish/PokeFinder/releases/download/v$pkgver/PokeFinder-linux.tar.gz"
)
sha256sums=('82430e0a93c738b829acad35bcf89079f1fabcb464e96fa4de126167a847a789')

package() {
    install -v -m755 -d "$pkgdir/usr/bin/"
    install -v -m755 "$srcdir/PokeFinder" "$pkgdir/usr/bin/pokefinder"
}
