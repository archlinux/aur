# Mantainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>

pkgname=pandoc-eqnos
pkgver=1.4.3
pkgrel=1
pkgdesc="Equation number filter for pandoc"
url="https://github.com/tomduck/pandoc-eqnos"
depends=('pandoc-xnos>=0.15.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-eqnos/archive/${pkgver}.tar.gz")
md5sums=('e0f31d0d1a97cfa39b0a4466c00d37d9')

build() {
    cd "$srcdir/pandoc-eqnos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-eqnos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
