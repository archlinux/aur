# Maintainer: Szymon Scholz
pkgname=python2-rstex
_realname=rstex
pkgver=0.12
pkgrel=2
pkgdesc="An extension of docutils' rst2latex with inline math, equations, references, and raw latex"
url="https://pypi.org/project/rstex/"
depends=('python2')
license=('BSD License')
arch=('any')
source=('https://pypi.python.org/packages/source/r/rstex/rstex-0.12.tar.gz')
md5sums=('7af2824d613f8c514335c0c002473f09')

build() {
    cd $srcdir/$_realname-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/$_realname-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
