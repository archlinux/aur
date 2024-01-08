# Maintainer: Marek Hilton <imperial.ac.uk: marek.hilton15>
# Contributor: Marek Hilton <imperial.ac.uk: marek.hilton15>

pkgname=pandoc-theoremnos
pkgver=2.0.0a3
pkgrel=1
pkgdesc="Theorem number filter for pandoc"
url="https://github.com/tomduck/pandoc-theoremnos"
depends=('pandoc-xnos>=2.5.0' 'pandoc-xnos<3.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-theoremnos/archive/${pkgver}.tar.gz")
md5sums=('72b2d8633e4817ea2cf672da2aa7baa7')

build() {
    cd "$srcdir/pandoc-theoremnos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-theoremnos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
