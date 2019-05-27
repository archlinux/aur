# Contributor: Jake Mannens <jakem_5@hotmail.com>
pkgname=ocrf
pkgver=0.1
pkgrel=1
pkgdesc="Optical character recognition search engine/indexer"
arch=('any')
url="https://gitlab.com/plasmicplexus/ocrf"
license=('GPL3')
depends=('tesseract')
source=("https://gitlab.com/plasmicplexus/ocrf/-/archive/$pkgver/ocrf-$pkgver.tar.gz")
md5sums=("220991c8adc528368bbdec17bb98a4ee")

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=4 sts=4 sw=4 et
