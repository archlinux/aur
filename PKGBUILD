# Maintainer: Dave Kleinschmidt <gmail.com: dave.f.kleinschmidt>
# Maintainer: Michael <th-nuernberg.de: bauermi86944>

pkgname=pandoc-xnos
pkgver=2.5.0
pkgrel=1
pkgdesc="Library code for the pandoc-fignos/eqnos/tablenos filters."
url="https://github.com/tomduck/pandoc-xnos"
depends=('python-pandocfilters' 'python-psutil')
license=('GPL')
arch=('any')
source=("https://github.com/tomduck/pandoc-xnos/archive/${pkgver}.tar.gz")
md5sums=('270aae21d342c26020b6aec583e373e9')

build() {
    cd "$srcdir/pandoc-xnos-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pandoc-xnos-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
