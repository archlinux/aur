# Maintainer: jakob <grandchild@gmx.net>

_pkgname=pyheif
pkgname=python-${_pkgname}
pkgver=0.7.1
pkgrel=1
pkgdesc="Python interface to libheif using CFFI (reading only)"
arch=(x86_64 i686 aarch64)
url="https://github.com/david-poirier-csn/pyheif"
license=('Apache')
depends=(python libheif)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('86a5c5174379d7146b5ed1a68892faf7268a135fb7f5039a011bfb7a6e903200')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
