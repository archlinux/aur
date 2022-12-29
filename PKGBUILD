# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
pkgname=('python-pycifrw')
_name='PyCifRW'
pkgver=4.4.5
pkgrel=1
pkgdesc="CIF/STAR file support for Python"
url="https://bitbucket.org/jamesrhester/pycifrw"
arch=("any")
license=('Python-2.0')
makedepends=('python-setuptools')
depends=('python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a8fd092cbefe6ddd4b7e667d05682e5c8c2e64ba63e7ef8b3ce4c07f2ff62827')

package() {
    cd "$srcdir/${_name}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
