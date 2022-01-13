# Maintainer: mcgyver <newsletter.sergio@gmail.com>

pkgbase=python-brian2
pkgname=('python-brian2')
_name=Brian2
pkgver=2.5.0.2
pkgrel=1
pkgdesc="A clock-driven simulator for spiking neural networks"
arch=('any')
url="https://pypi.org/project/Brian2/"
license=("CeCILL-2.1")
depends=('python>=3.7' 'python-numpy>=1.17' 'python-sympy>=1.2' 'cython>=0.29' 'python-pyparsing' 'python-jinja>=2.7' 'python-setuptools>=21' 'python-py-cpuinfo' 'gsl>=1.16' 'python-scipy>=0.13.3' 'python-matplotlib>=2.0' 'python-sphinx>=1.8' 'python-pytest' 'python-pytest-xdist')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('70e6f88fb26f04ccafb91e0a29999774e45899771357aff7043951c853919a0f')

package_python-brian2() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}


