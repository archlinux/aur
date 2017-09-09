# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Joseph Brains <jnbrains@gmail.com>
_name=typing
pkgname=python-$_name
pkgver=3.6.2
pkgrel=1
pkgdesc='Type Hints for Python'
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/typing"
license=('PSF')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d514bd84b284dd3e844f0305ac07511f097e325171f6cc4a20878d11ad771849')

package() {
    cd "$srcdir/$_name-$pkgver"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
