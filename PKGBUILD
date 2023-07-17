# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-odrive
_name=${pkgname#python-}
pkgver=0.6.7
pkgrel=1
pkgdesc="Control utilities for the ODrive high performance motor controller"
arch=('any')
license=('MIT')
depends=('python-aiohttp' 'python-appdirs' 'ipython' 'python-pyelftools' 'python-pyusb' 'python-setuptools')
makedepends=(python-installer)
optdepends=('python-matplotlib: required to run the liveplotter')

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")

sha256sums=('e5a8f4754f7699e1db8f36c27a53de4919e9e089e807ba64860abcee70a88a8e')
noextract=()

package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
}
