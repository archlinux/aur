# Submitter: Kevin Brubeck Unhammer <unhammer@fsfe.org>

pkgname=python-editor
pkgver=0.4
pkgrel=1
pkgdesc="Programmatically open an editor, capture the result"
url="https://github.com/fmoo/python-editor"
depends=('python' )
license=('Apache')
arch=('any')
source=("https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('30de680ec944d073e0c3f18b44d5aa15')

build() {
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir"
}
