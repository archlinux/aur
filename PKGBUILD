# Maintainer: <dave.f.kleinschmidt@gmail.com>

pkgname=pandoc-xnos
pkgver=2.0.0
pkgrel=1
pkgdesc="Library code for the pandoc-fignos/eqnos/tablenos filters."
url="https://github.com/tomduck/pandoc-xnos"
depends=('python-pandocfilters' 'pandoc-attributes' 'python-psutil')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-xnos/archive/${pkgver}.tar.gz")
md5sums=('e57344b93dd012ea39bc8c5b6527e59b')

build() {
    cd "$srcdir/pandoc-xnos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-xnos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
