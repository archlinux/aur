# Submitter: Kevin Brubeck Unhammer <unhammer@fsfe.org>

pkgname=python2-editor
pkgver=0.4
pkgrel=1
pkgdesc="Programmatically open an editor, capture the result"
url="https://github.com/fmoo/python-editor"
depends=('python2' )
license=('Apache')
arch=('any')
_pkgname3=python-editor
source=("https://pypi.python.org/packages/source/p/${_pkgname3}/${_pkgname3}-${pkgver}.tar.gz")
md5sums=('30de680ec944d073e0c3f18b44d5aa15')

build() {
    cd $srcdir/${_pkgname3}-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/${_pkgname3}-${pkgver}
    python2 setup.py install --root="$pkgdir"
}
