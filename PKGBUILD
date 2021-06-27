# Maintainer: mcol <mcol@posteo.net>

# PKGBUILD @ mcol.xyz/code/aur-pywlroots

pkgname=pywlroots
pkgver=0.14.0
pkgrel=1
pkgdesc="Python binding to the wlroots library using cffi"
arch=(any)
license=('UIUC')
url="https://github.com/flacjacket/pywlroots"
depends=('python-setuptools' 'wlroots' 'python-xkbcommon' 'pywayland')
makedepends=()
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
