# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-openid-cla
pkgver=1.2
pkgrel=2
pkgdesc='CLA extension for python-openid'
arch=(any)
url='https://github.com/puiterwijk/python-openid-cla/'
license=(BSD)
depends=('python-openid')
makedeps=('python-setuptools')
source=("https://github.com/puiterwijk/python-openid-cla/archive/v${pkgver}.tar.gz")
sha256sums=('1ca811f26cc4609b3d2a283c526732e6a75cc9f4f0e43039518e244d7f8939a2')

package() {
  cd "python-openid-cla-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
