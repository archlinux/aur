# Maintainer: Philipp Joram <mail at phijor dot me>

pkgname=pokefinder
pkgver=2.5.0
pkgrel=2
pkgdesc='Cross platform Pokémon RNG tool'
arch=(x86_64)
url='https://github.com/Admiral-Fish/PokeFinder'
license=('GPL3')
depends=(
    'qt5-base'
)

source=(
    "$pkgname.zip::https://github.com/Admiral-Fish/PokeFinder/releases/download/v$pkgver/PokeFinder-linux.zip"
)
sha256sums=(
    'eb2d8d18ea379be6602f3b54a5dd5fb8625d981fd3094a7aedf2083e8d9a991b'
)

package() {
    install -v -m755 -d "$pkgdir/usr/bin/"
    install -v -m755 "$srcdir/PokeFinder" "$pkgdir/usr/bin/pokefinder"
}
