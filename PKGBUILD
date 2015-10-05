# Maintainer: Allen Downey <downey@allendowney.com>
# Contributor: Mikhail felixoid Shiryaev <mr.felixoid na gmail d com>

_pip=swampy
pkgname=python-$_pip
pkgver=2.1.7
pkgrel=1
pkgdesc="Companion code for Think Python."
arch=('any')
url="http://www.greenteapress.com/thinkpython/$_pip/"
license=('GPL')
depends=('python')
source=("https://pypi.python.org/packages/source/s/$_pip/$_pip-${pkgver}.tar.gz")
sha256sums=('a7046d007ec1a477669be0c8ca8dd300204e7f5fc6b7e72d7ab3e09d4ddcf6c3')


package() {
    cd $srcdir/$_pip-$pkgver
    python setup.py install --root=$pkgdir
}

