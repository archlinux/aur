# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Joseph Brains <jnbrains@gmail.com>
_name=typing
pkgname=python-$_name
pkgver=3.6.4
pkgrel=1
pkgdesc='Type Hints for Python'
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/typing"
license=('PSF')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d400a9344254803a2368533e4533a4200d21eb7b6b729c173bc38201a74db3f2')

package() {
    cd "$srcdir/$_name-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
