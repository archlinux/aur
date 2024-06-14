# Maintainer: zayn7lie <zayn7lie.ber7+git@gmail.com>

_pkgname='cplex'
pkgname="python-${_pkgname}"
pkgver=22.1.1.2
pkgrel=1
pkgdesc="A Python interface to the CPLEX Callable Library, Community Edition"
arch=('x86_64')
url='https://pypi.org/project/cplex/'
license=('custom')
depends=('python311')
makedepends=('python-installer')
source=("${_pkgname}-${pkgver}-cp311-cp311-manylinux1_${arch}.whl::https://files.pythonhosted.org/packages/59/10/af7410d6568df0a78e442ccd3a1a11a21c0633a3f4c17544c5632a3a40da/${_pkgname}-${pkgver}-cp311-cp311-manylinux1_${arch}.whl")
sha256sums=('2a0f6984980779e6878a6cded52ee08806bae49af6bd209c7740549417e69e96')

package() {
    python3.11 -m installer --destdir="${pkgdir}" "${srcdir}/"*.whl
}
