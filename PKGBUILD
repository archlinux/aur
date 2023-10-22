# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=python-pyedbglib
pkgver=2.23.0.14
pkgrel=1
pkgdesc="Low-level protocol library for communicating with Microchip CMSIS-DAP based debuggers"
_name=${pkgname#python-}
arch=('x86_64')
url="https://github.com/microchip-pic-avr-tools/pyedbglib"
license=('MIT')
depends=()
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('34ea897d2e1793d970e4a5a4f7d61539cad6f3db255d82c541495323c7e2bfe3')
makedepends=('python-installer')

package() {
	python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
}
