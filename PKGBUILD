# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>
#
_pkgname="ws4py"
pkgname="python-${_pkgname}"
pkgver=0.4.3
pkgrel=1
pkgdesc="WebSocket client and server library for Python."
url="https://github.com/Lawouach/WebSocket-for-Python"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Lawouach/WebSocket-for-Python/archive/${pkgver}.tar.gz")
sha256sums=('5eeb2937648c81eb0d503fce84a46cfec8665afaf9ab487219796e9ee3057872')

package() {
	cd "${srcdir}/WebSocket-for-Python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=4 sw=2 ft=sh et:
