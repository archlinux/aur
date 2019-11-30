# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-flufl-bounce')
_pkgbase='flufl.bounce'
pkgver=2.3
pkgrel=1
pkgdesc="Email bounce detectors"
arch=(any)
url="https://launchpad.net/flufl.bounce"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/f/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('6a2b7265af291eac41cb1022442ee65ff1c1f5af307bf8820a3f38cc86d29f99')
makedepends=('python-setuptools')

package_python-flufl-bounce() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
