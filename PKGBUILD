# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=i3ipc-python
pkgver=1.6.0
pkgrel=1
pkgdesc="An improved Python library to control i3wm"
arch=("any")
url="https://github.com/acrisci/${pkgname}"
license=("custom:BSD")
depends=("python")
makedepends=("git" "python-setuptools")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/acrisci/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8136db291f004992ef521cf77e9215e37974a768089601db18e642ac01412ca7')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=4 et:
