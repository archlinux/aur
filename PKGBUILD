# Maintainer: Darshit Shah <darnir@gmail.com>

_python=python
_name=gdb-tools

pkgname=$_python-${_name}
pkgver=1.1
pkgrel=1
pkgdesc="Various tools to improve the gdb experience"
depends=('python')
makedepends=('python-setuptools')
arch=('any')
source=("https://pypi.python.org/packages/a7/ee/8b621bb3e56ef01828712cb857a23a8d8fa20c0c09a18aa0487e3a234bb6/gdb-tools-1.1.tar.gz")
md5sums=('7d31327e5c389506171f6ebadf3b9e5f')
url="https://github.com/vuvova/gdb-tools"
license=('GPL2')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    $_python setup.py install --root="$pkgdir" --optimize=1
}
