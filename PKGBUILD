# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=python-pyral
_pkgname=pyral
pkgver=1.3.1
pkgrel=1
pkgdesc="Python Toolkit for Rally"
arch=('any')
url="https://github.com/RallyTools/RallyRestToolkitForPython"
license=("PYRAL")
depends=('python' 'python-requests')
source=("https://github.com/RallyTools/RallyRestToolkitForPython/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1f3ee31e78e5a556370c2e1bb950cef57ae7b82033d72ad996f97b149a51e5c7')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
