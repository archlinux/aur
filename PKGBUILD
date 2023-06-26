# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-odrive
_name=${pkgname#python-}
pkgver=0.6.5.post2
pkgrel=1
pkgdesc="Control utilities for the ODrive high performance motor controller"
arch=('any')
license=('MIT')
depends=('python-aiohttp' 'python-appdirs' 'ipython' 'python-pyelftools' 'python-pyusb' 'python-setuptools')
makedepends=(python-installer)
optdepends=('python-matplotlib: required to run the liveplotter')

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")

sha256sums=('8fd8fd957eb67c477d01eed8cbac1fd557229cdfd81c7ebdb3f4d5cee21caa19')
noextract=()

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
