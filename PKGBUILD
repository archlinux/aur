# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=python-pymcuprog
pkgver=3.14.2.9 
pkgrel=1
pkgdesc="Tools for programming of MCUs using Microchip CMSIS-DAP based debuggers"
_name=${pkgname#python-}
arch=('x86_64')
url="https://github.com/microchip-pic-avr-tools/pymcuprog"
license=('MIT')
depends=()
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('fdf51f895ada0b54f9be6ad614bf15f51622bf49019aca993fa37f72fbb608ed')
makedepends=('python-installer')

package() {
	python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
}
