# Mantainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>

pkgname=pandoc-tablenos
pkgver=1.4.2
pkgrel=1
pkgdesc="Table number filter for pandoc"
url="https://github.com/tomduck/pandoc-tablenos"
depends=('pandoc-xnos>=0.15.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-tablenos/archive/${pkgver}.tar.gz")
md5sums=('430265b513c49071898ddfdb06222b25')

build() {
    cd "$srcdir/pandoc-tablenos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-tablenos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
