# Maintainer: Lorenz Steinert <lorenz AT steinerts DOT de>

pkgname=('python2-lazr-smtptest')
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
makedepends=('python2-setuptools')

package_python2-lazr-smtptest() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
