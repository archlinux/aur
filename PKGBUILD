# Mantainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>

pkgname=pandoc-tablenos
pkgver=2.1.1
pkgrel=1
pkgdesc="Table number filter for pandoc"
url="https://github.com/tomduck/pandoc-tablenos"
depends=('pandoc-xnos>=2.0.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-tablenos/archive/${pkgver}.tar.gz")
md5sums=('161e32692073b985cb014c1f0541eedd')

build() {
    cd "$srcdir/pandoc-tablenos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-tablenos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
