# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-lazr-smtptest' 'python2-lazr-smtptest')
_pkgbase='lazr.smtptest'
pkgver=2.0.3
pkgrel=1
pkgdesc="A framework for testing SMTP-based applications and libraries"
arch=(any)
url="https://launchpad.net/lazr.smtptest"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/l/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('9dca1890677a7fd022b1e36ea52dd22cea8bd3a3f2decb5b9625207b8ebf6e15')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-lazr-smtptest() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-lazr-smtptest() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
