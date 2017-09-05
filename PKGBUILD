# Mantainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>

pkgname=pandoc-tablenos
pkgver=0.17.1
pkgrel=1
pkgdesc="Table number filter for pandoc"
url="https://github.com/tomduck/pandoc-tablenos"
depends=('pandoc-xnos>=0.9.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-tablenos/archive/${pkgver}.tar.gz")
md5sums=('1d48e07977e1c4ea8185e4cb28ec217f')

build() {
    cd "$srcdir/pandoc-tablenos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-tablenos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
