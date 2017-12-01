# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=python-aprs
_pkgname=aprs
pkgver=7.0.0
pkgrel=1
pkgdesc="A Python Module that supports connecting to APRS Interfaces, and receiving, parsing and sending APRS Frames."
arch=('any')
url="https://github.com/ampledata/aprs"
license=('Apache')
depends=(python python-kiss python-requests python-bitarray)
source=("https://files.pythonhosted.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('cd4d0209fd20697bf0b0550b5032ce09')

package() {
    cd $_pkgname-$pkgver/
    python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
