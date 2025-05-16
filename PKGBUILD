# Maintainer: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-brian2
pkgname=('python-brian2')
_name=brian2
pkgver=2.9.0
pkgrel=1
pkgdesc="A clock-driven simulator for spiking neural networks"
arch=('any')
url="https://pypi.org/project/Brian2/"
license=("CeCILL-2.1")
depends=('python>=3.10' 'python-numpy>=1.23' 'python-sympy>=1.2' 'cython>=0.29.21' 'python-pyparsing' 'python-jinja>=2.7' 'python-setuptools>=61' 'python-py-cpuinfo' 'gsl>=1.16' 'python-scipy>=0.13.3' 'python-matplotlib>=2.0' 'python-sphinx>=7' 'python-pytest' 'python-pytest-xdist')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e4ddeec1cc23f37542e3d067acea2770623c264fbded144ca6d7a1b6cc3ca397')

package_python-brian2() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}


