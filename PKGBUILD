# Contributor: Matthew Hague <matthewhague@zoho.com>

pkgbase=python2-numberjack
pkgname=('python2-numberjack')
pkgdesc="A Python2 platform for combinatorial optimisation"
pkgver=1.1.4
pkgrel=1
license=('GPLv2')
arch=('any')
url="http://pypi.python.org/pypi/numberjack"
depends=('python2')
makedepends=('swig')
source=("https://pypi.python.org/packages/source/N/Numberjack/Numberjack-${pkgver}.tar.gz")
md5sums=('78469a8ae07d830a883c349edde5a371')

package() {
  cd Numberjack-${pkgver}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
