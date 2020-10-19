# Maintainer: jakob <grandchild@gmx.net>

_pkgname=pyheif
pkgname=python-${_pkgname}
pkgver=0.5.1
pkgrel=1
pkgdesc="Python interface to libheif using CFFI (reading only)"
arch=(x86_64 i686 aarch64)
url="https://github.com/david-poirier-csn/pyheif"
license=('Apache')
depends=(python libheif)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('f4ae1dc659b0f8daf63083a298f6ce99e8fec09cf1af125bacaee2b37a13989b')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
