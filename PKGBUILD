# Contributor: Timo Schmiade <the_isz@gmx.de>

pkgname=mtg_deck_composer
pkgver=0.1
pkgrel=1
pkgdesc="Proxy generator for Magic: The Gathering cards written in python using ImageMagick"
arch=(any)
url="https://github.com/the-isz/mtg_deck_composer"
license=("GPL")
depends=("python" "imagemagick" "ghostscript")
options=(!emptydirs)
source=("https://github.com/the-isz/$pkgname/tarball/$pkgver")
md5sums=("87dbd58c1a16de73ec09de8697d3bd80")

build() {
  cd "$srcdir/the-isz-$pkgname-3a7b6d2"

  python deployment/setup.py install --root=$pkgdir/ --optimize=1
}
