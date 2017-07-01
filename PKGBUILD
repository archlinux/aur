# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>
#
_pkgname="ws4py"
pkgname="python-${_pkgname}"
pkgver=0.4.2
pkgrel=1
pkgdesc="WebSocket client and server library for Python."
url="https://github.com/Lawouach/WebSocket-for-Python"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Lawouach/WebSocket-for-Python/archive/${pkgver}.tar.gz")
sha256sums=('eb47a057863ec789611091c22480f0333e746fe01ce3df34525ab0c12d52bc2b')

package() {
	cd "${srcdir}/WebSocket-for-Python-${pkgver}"
	python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=4 sw=2 ft=sh et:
