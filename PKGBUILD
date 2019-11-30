# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-lazr-smtptest')
_pkgbase='lazr.smtptest'
pkgver=2.0.4
pkgrel=1
pkgdesc="A framework for testing SMTP-based applications and libraries"
arch=(any)
url="https://launchpad.net/lazr.smtptest"
license=('LGPL')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/l/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
md5sums=('e8e62cae9d3484e5efd6e26939648ae9')
makedepends=('python-setuptools')

package_python-lazr-smtptest() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
