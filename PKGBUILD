# Maintainer: Philipp Joram <mail at phijor dot me>

pkgname=pokefinder
pkgver=3.0.1
pkgrel=2
pkgdesc='Cross platform Pokémon RNG tool'
arch=(x86_64)
url='https://github.com/Admiral-Fish/PokeFinder'
license=('GPL3')
depends=(
    'qt5-base'
)

source=(
    "$pkgname-$pkgver.zip::https://github.com/Admiral-Fish/PokeFinder/releases/download/v$pkgver/PokeFinder-linux.zip"
)
sha256sums=('cbb8854280b76496b9842b507391263a12fb0e066431560f7b90c342ed0b3b0e')

package() {
    install -v -m755 -d "$pkgdir/usr/bin/"
    install -v -m755 "$srcdir/PokeFinder" "$pkgdir/usr/bin/pokefinder"
}
