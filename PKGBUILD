# Maintainer: Tea <icepie.dev@gmail.com>

_pkgname=pyatv
pkgname=pyatv-git
pkgbase=pyatv
pkgver=0.9.8
pkgrel=1
pkgdesc="A client library for Apple TV and AirPlay devices"
arch=('any')
url="https://pyatv.dev"
license=('MIT')
conflicts=('pyatv')
depends=(
    'python'
)
source=("git://github.com/postlund/pyatv.git")
sha256sums=(
    'SKIP'
)

build() {
    cd "${_pkgname}"
    python setup.py build
}

package() {
    cd "${_pkgname}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
