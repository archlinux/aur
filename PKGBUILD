# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=python-kiss
_pkgname=kiss
pkgver=7.0.0
pkgrel=1
pkgdesc="A Python Module that implementations the KISS Protocol for communicating with KISS-enabled devices (such as Serial or TCP TNCs)."
arch=('any')
url="https://github.com/ampledata/kiss"
license=('Apache')
depends=(python python-pyserial)
source=("https://files.pythonhosted.org/packages/source/k/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('04acf4d8fe50d9150d19ead55a25c015')

package() {
    cd $_pkgname-$pkgver/
    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
