# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=python-pihole5-list-tool
_pypiname=${pkgname/python-/}
pkgver=0.6.0
pkgrel=1
pkgdesc='A tool for quickly and easily bulk adding whitelists and ad/block/blacklists to a Pi-hole 5 installation'
arch=('any')
url="https://pypi.python.org/pypi/${_pypiname}/"
license=('MIT')
depends=('python-requests' 'python-ansicolors' 'python-pyinquirer')
source=("https://files.pythonhosted.org/packages/77/cc/c0ea6908fc170b23079a3df2c0b6877fc6d6a41d36066a895208ad10bd31/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('c891c98851ac0492bb619cfd086be5fdbc1e6b044e4710decfbae9abab6b19eb')

package() {
    cd ${_pypiname}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}
