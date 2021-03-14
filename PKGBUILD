# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-backports-abc
pkgver=0.5
pkgrel=3
pkgdesc="A backport of recent additions to the 'collections.abc' module."
arch=('any')
url='https://pypi.python.org/pypi/backports_abc'
license=('PSF')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/b/backports_abc/backports_abc-${pkgver}.tar.gz")
sha256sums=('033be54514a03e255df75c5aee8f9e672f663f93abb723444caec8fe43437bde')

check() {
  cd backports_abc-${pkgver}
  python2 tests.py
}

package() {
  cd backports_abc-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
