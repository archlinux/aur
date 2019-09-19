# Mantainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>

pkgname=pandoc-eqnos
pkgver=2.0.0
pkgrel=1
pkgdesc="Equation number filter for pandoc"
url="https://github.com/tomduck/pandoc-eqnos"
depends=('pandoc-xnos>=2.0.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-eqnos/archive/${pkgver}.tar.gz")
md5sums=('7dee322c0828ecb5aeb24ea8915d14cf')

build() {
    cd "$srcdir/pandoc-eqnos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-eqnos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
