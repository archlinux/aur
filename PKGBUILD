# Maintainer: jakob <grandchild@gmx.net>

_pkgname=pyheif
pkgname=python-${_pkgname}
pkgver=0.8.0
pkgrel=1
pkgdesc="Python interface to libheif using CFFI (reading only)"
arch=(x86_64 i686 aarch64)
url="https://github.com/david-poirier-csn/pyheif"
license=('Apache')
depends=(python libheif)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('e9b4c11ebad482fc25a0804ce295b44b660cbf7829a228f56b071f325f9e0de4')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
