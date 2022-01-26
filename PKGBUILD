# Maintainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>
# Maintainer: Michael <th-nuernberg.de: bauermi86944>

pkgname=pandoc-tablenos
pkgver=2.3.0
pkgrel=1
pkgdesc="Table number filter for pandoc"
url="https://github.com/tomduck/pandoc-tablenos"
depends=('pandoc-xnos>=2.5.0' 'pandoc-xnos<3.0')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-tablenos/archive/${pkgver}.tar.gz")
md5sums=('006d03a683e7c2b17ef206941873c70f')

build() {
    cd "$srcdir/pandoc-tablenos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-tablenos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
