# Maintainer: Darshit Shah <darnir@gmail.com>

_python=python
_name=gdb-tools

pkgname=$_python-${_name}
pkgver=1.2
pkgrel=1
pkgdesc="Various tools to improve the gdb experience"
depends=('python')
makedepends=('python-setuptools')
arch=('any')
source=("https://files.pythonhosted.org/packages/9f/db/91ea58f475bdcf56493c9510cb453ed2f4868bf42618cebc9ba5a6ab4e41/gdb-tools-1.2.tar.gz")
md5sums=('42782b47e2c317dcdde724925dfc09fa')
url="https://github.com/vuvova/gdb-tools"
license=('GPL2')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    $_python setup.py install --root="$pkgdir" --optimize=1
}
