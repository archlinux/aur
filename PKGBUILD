# Contributor: anekos <anekos@snca.net>
pkgname=python-cmigemo
pkgver="0.1.5"
pkgrel=2
pkgdesc="python-cmigemo is a pure python binding for C/Migemo"
url="https://github.com/mooz/python-cmigemo"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'cmigemo' 'python-distribute')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("python-cmigemo-${pkgver}.zip::https://github.com/mooz/python-cmigemo/archive/v${pkgver}.zip")
sha256sums=('e28511b64924ccf0a95241af0d9988dac9b5743b7353c3f8ed30ee18d5eafbde')

package () {
  cd "${srcdir}/python-cmigemo-${pkgver}"
  python setup.py build
  python setup.py install --root="${pkgdir}"
}

# vim:set ts=2 sw=2 et:


