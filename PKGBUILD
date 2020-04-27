# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-openid-teams
pkgname=('python-openid-teams' 'python2-openid-teams')
pkgver=1.2
pkgrel=1
pkgdesc='Teams extension for python-openid'
arch=(any)
url='https://github.com/puiterwijk/python-openid-teams/'
license=(BSD)
makedeps=('python-setuptools' 'python2-setuptools')
source=("https://github.com/puiterwijk/python-openid-teams/archive/v${pkgver}.tar.gz")
sha256sums=('07bd9325135f264be2732c92194c22f6a104d0869b9eeed239c0a122ceac3c4d')

package_python-openid-teams() {
  pkgdesc='Utilities used around Fedora Infrastructure to send and receive messages (Python 3 version)'
  depends=('python-openid')
  cd "python-openid-teams-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-openid-teams() {
  pkgdesc='Utilities used around Fedora Infrastructure to send and receive messages (Python 2 version)'
  depends=('python2-openid')
  cd "python-openid-teams-${pkgver}"

  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
