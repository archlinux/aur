# Maintainer: <gmail.com: jese.jaara>

pkgname=pandoc-xnos
pkgver=0.3
pkgrel=1
pkgdesc="Library code for the pandoc-fignos/eqnos/tablenos filters."
url="https://github.com/tomduck/pandoc-xnos"
depends=('python-pandocfilters' 'pandoc-attributes' 'python-psutil')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-xnos/archive/${pkgver}.tar.gz")
md5sums=('650d347992aeb69ee1d83f1ce0b0427b')

build() {
    cd "$srcdir/pandoc-xnos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-xnos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
