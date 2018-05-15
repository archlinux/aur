# Mantainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>

pkgname=pandoc-eqnos
pkgver=1.2.0
pkgrel=1
pkgdesc="Equation number filter for pandoc"
url="https://github.com/tomduck/pandoc-eqnos"
depends=('pandoc-xnos>=0.9.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-eqnos/archive/${pkgver}.tar.gz")
md5sums=('3560ba8e7a65e23efab7c3d51cd06bf9')

build() {
    cd "$srcdir/pandoc-eqnos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-eqnos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
