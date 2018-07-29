# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=i3ipc-python
pkgver=1.5.1
pkgrel=2
pkgdesc="An improved Python library to control i3wm"
arch=("any")
url="https://github.com/acrisci/${pkgname}"
license=("custom:BSD")
depends=("python")
makedepends=("git" "python-setuptools")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/acrisci/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('aa26ca148a1e745bc0c356f8f04e06e8269a6744d9eb1d6135cfb1adf998bffa')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=4 et:
