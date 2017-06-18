# Maintainer: Joseph Brains <jnbrains@gmail.com>
_name=typing
pkgname=python-$_name
pkgver=3.6.1
pkgrel=1
pkgdesc='Type Hints for Python'
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/typing"
license=('PSF')
depends=('python3')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('3fec97415bae6f742fb3c3013dedeb89')

package() {
    cd "$srcdir/$_name-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
