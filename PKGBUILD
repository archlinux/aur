# Maintainer: somini <dev@somini.xyz>

pkgbase=python-libinput
pkgname=python-libinput
_module='python-libinput'
pkgver=0.3.0pre1
# TODO: remove
_commit=1f477ee9f1d56b284b20e0317ea8967c64ef1218
pkgrel=3
pkgdesc="Object-oriented wrapper for libinput using ctypes"
url="https://github.com/OzymandiasTheGreat/python-libinput"
depends=('python' 'libinput')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
# TODO: revert
source=("$_module-$pkgver.tar.gz::https://github.com/OzymandiasTheGreat/python-libinput/archive/$_commit.tar.gz")
sha256sums=('122b5bff25094e1179ceff6f978c8ba19bc5a0a25b5520ffe1f20e92f99017a5')

build() {
    # TODO: revert
    cd "${srcdir}/${_module}-$_commit"
    python setup.py build
}

package() {
    # TODO: revert
    cd "${srcdir}/${_module}-$_commit"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
