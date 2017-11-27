# Contributor: Felix Igelbrink <felix.igelbrink@uos.de>

pkgbase=python-numberjack
pkgname=('python-numberjack')
pkgdesc="A Python platform for combinatorial optimisation"
pkgver=1.2.0
pkgrel=1
license=('GPLv2')
arch=('any')
url="http://pypi.python.org/pypi/numberjack"
depends=('python')
makedepends=('swig')
_name=Numberjack
source=("https://files.pythonhosted.org/packages/source/N/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('98a4757dc3ee20da0a7a69999afc4dbc')

package() {
  cd Numberjack-${pkgver}
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}
