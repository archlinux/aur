
# Maintainer: Andres F. Urquijo <alfagalileox@gmail.com>

pkgname=python2-ivisual
_pkgname=IVisual
pkgver=0.2.00
pkgrel=1
pkgdesc="IVisual provides VPython visual API for inline use in an IPython Notebook"
arch=("any")
url="https://pypi.python.org/pypi/IVisual/0.1.99"
license=('GPL')
depends=("python2-vpython" "ipython2")
source="https://pypi.python.org/packages/source/I/$_pkgname/$_pkgname-$pkgver.zip"
md5sums=("636d0cca0c154c3e965782351fd7e63a")

build(){
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py build
}

package(){
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir"
}
