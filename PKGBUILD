# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-openid-cla
pkgname=('python-openid-cla' 'python2-openid-cla')
pkgver=1.2
pkgrel=1
pkgdesc='CLA extension for python-openid'
arch=(any)
url='https://github.com/puiterwijk/python-openid-cla/'
license=(BSD)
makedeps=('python-setuptools' 'python2-setuptools')
source=("https://github.com/puiterwijk/python-openid-cla/archive/v${pkgver}.tar.gz")
sha256sums=('1ca811f26cc4609b3d2a283c526732e6a75cc9f4f0e43039518e244d7f8939a2')

package_python-openid-cla() {
  pkgdesc='Utilities used around Fedora Infrastructure to send and receive messages (Python 3 version)'
  depends=('python-openid')
  cd "python-openid-cla-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-openid-cla() {
  pkgdesc='Utilities used around Fedora Infrastructure to send and receive messages (Python 2 version)'
  depends=('python2-openid')
  cd "python-openid-cla-${pkgver}"

  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
