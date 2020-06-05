# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=python-pihole5-list-tool
_pypiname=${pkgname/python-/}
pkgver=0.4.4
pkgrel=2
pkgdesc='A tool for quickly and easily bulk adding whitelists and ad/block/blacklists to a Pi-hole 5 installation'
arch=('any')
url="https://pypi.python.org/pypi/${_pypiname}/"
license=('MIT')
depends=('python-requests' 'python-ansicolors' 'python-inquirer')
source=("https://files.pythonhosted.org/packages/15/37/89e20ff4c5c2115001c488221f38d09a0a29c680d06c1d9082e1a3e33aff/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('c4b1693aae9a8f44c8d00a59ac5bbece648016e7b8dbd85b772f086a8e16fc7a')

package() {
    cd ${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}
