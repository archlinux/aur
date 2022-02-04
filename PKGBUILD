# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-openid-teams
pkgver=1.2
pkgrel=1
pkgdesc='Teams extension for python-openid'
arch=(any)
url='https://github.com/puiterwijk/python-openid-teams/'
license=(BSD)
makedeps=('python-setuptools')
  depends=('python-openid')
source=("https://github.com/puiterwijk/python-openid-teams/archive/v${pkgver}.tar.gz")
sha256sums=('07bd9325135f264be2732c92194c22f6a104d0869b9eeed239c0a122ceac3c4d')

package() {
  cd "python-openid-teams-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
