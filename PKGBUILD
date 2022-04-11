# Maintainer: jakob <grandchild@gmx.net>

_pkgname=pyheif
pkgname=python-${_pkgname}
pkgver=0.7.0
pkgrel=1
pkgdesc="Python interface to libheif using CFFI (reading only)"
arch=(x86_64 i686 aarch64)
url="https://github.com/david-poirier-csn/pyheif"
license=('Apache')
depends=(python libheif)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('f5b6e810d79c3a181d6d09dfc522ebcc300f3fc875c0de518d61cfeb00705353')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
