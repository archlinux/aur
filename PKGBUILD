# Current Packager: Christoph Stahl <christoph.stahl@uni-dortmund.de>

_pipname=pySmartDL
pkgbase=python-pysmartdl
pkgname=('python-pysmartdl')
pkgver=1.3.3
pkgrel=1
pkgdesc="A Smart Download Manager for Python"
arch=('any')
url="https://github.com/iTaybb/pySmartDL/"
license=('Public Domain')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('8d3cb06f071f47b10a5f35e3b9d1c1fd')

package_python-pysmartdl() {
    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1
}

