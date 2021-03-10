# Maintainer: Allen Downey <downey@allendowney.com>
# Contributor: Mikhail felixoid Shiryaev <mr.felixoid na gmail d com>

_pip=swampy
pkgname=python-$_pip
pkgver=3.0.1
pkgrel=1
pkgdesc="Companion code for Think Python."
arch=('any')
url="http://www.greenteapress.com/thinkpython/$_pip/"
license=('GPL')
depends=('python')
source=("https://pypi.python.org/packages/source/s/$_pip/$_pip-${pkgver}.tar.gz")
sha256sums=('bf3c11ff33fee34563254d411c7b79570d519b176924b832b1cbdd88eb94999f')


package() {
    cd $srcdir/$_pip-$pkgver
    python setup.py install --root=$pkgdir
}

