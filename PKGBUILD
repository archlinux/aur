# Current Packager: Christoph Stahl <christoph.stahl@uni-dortmund.de>

_pipname=pySmartDL
pkgbase=python-pysmartdl
pkgname=('python-pysmartdl')
pkgver=1.3.4
pkgrel=1
pkgdesc="A Smart Download Manager for Python"
arch=('any')
url="https://github.com/iTaybb/pySmartDL/"
license=('Public Domain')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('35275d1694f3474d33bdca93b27d3608265ffd42f5aeb28e56f38b906c0c35f4')

package_python-pysmartdl() {
    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1
}

