# Contributor: Jake Mannens <jakem_5@hotmail.com>
pkgname=ocrf
pkgver=0.2
pkgrel=1
pkgdesc="Optical character recognition search engine/indexer"
arch=('any')
url="https://gitlab.com/plasmicplexus/ocrf"
license=('GPL3')
depends=('tesseract')
source=("https://gitlab.com/plasmicplexus/ocrf/-/archive/$pkgver/ocrf-$pkgver.tar.gz")
md5sums=("5a93c68a365d132f46d389b90322a651")

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=4 sts=4 sw=4 et
