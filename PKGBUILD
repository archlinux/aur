# Maintainer: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=python-ws4py
_pkgname=ws4py
pkgver=0.3.4
pkgrel=1
pkgdesc='WebSocket client and server library for Python.'
arch=('any')
url='https://pypi.python.org/pypi/ws4py'
license=('BSD')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.python.org/packages/source/w/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('6b47e33cbd13f5c134b04f2a44a480ad')

package() {
  cd $srcdir/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
