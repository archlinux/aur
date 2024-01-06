# Contributor: Matthew Hague <matthewhague@zoho.com>

pkgbase=python2-numberjack
pkgname=('python2-numberjack')
pkgdesc="A Python2 platform for combinatorial optimisation"
pkgver=1.2.0
pkgrel=2
license=('GPLv2')
arch=('any')
url="http://pypi.python.org/pypi/numberjack"
depends=('python2')
makedepends=('swig')
source=("https://pypi.python.org/packages/source/N/Numberjack/Numberjack-${pkgver}.tar.gz")
md5sums=('98a4757dc3ee20da0a7a69999afc4dbc')

package() {
  cd Numberjack-${pkgver}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
