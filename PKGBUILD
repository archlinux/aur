# Maintainer: mcol <mcol@posteo.net>

# PKGBUILD @ mcol.xyz/code/aur-pywayland

pkgname=pywayland
pkgver=0.4.4
pkgrel=1
pkgdesc="Python bindings for the libwayland library"
arch=(any)
license=('Apache2')
url="https://github.com/flacjacket/pywayland"
depends=('python-setuptools')
makedepends=('python-setuptools')
sha256sums=('SKIP')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")


build() {
    cd "${srcdir}/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}"
}
