# Contributor: utahta < labs.ninxit at gmail dot com >
# Maintainer: Fabien Devaux < fdev31 at gmail dot com >

pkgname=pythonbrew
pkgver=1.3.6
pkgrel=1
pkgdesc='Manage python installations in your $HOME'
arch=(any)
url="https://github.com/utahta/pythonbrew"
license=('MIT')
depends=('python')
makedepends=('python-distribute')

source=(http://pypi.python.org/packages/source/p/pythonbrew/pythonbrew-${pkgver}.tar.gz)
md5sums=('aa968680a8b61fdc034ce01b31311614')

build() {
  cd "${srcdir}/pythonbrew-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
