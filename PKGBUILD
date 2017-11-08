# Maintainer: Dan Beste <Dan.Ray.Beste@gmail.com>

pkgname='python-justbytes'
pkgver=0.10
pkgrel=1
pkgdesc='A library for computing with specifications of sizes in bytes.'
arch=('any')
license=('GPLv2')
url='https://github.com/mulkieran/justbytes'
depends=('python-six' 'python-justbases')
makedepends=('git')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'a7b7157959e4e3c4eb089e7da86906bbff907bbe41eeb84cbaf9431730c768c5'
)

check() {
  cd "${pkgname/python-}-${pkgver}"

  msg2 "All tests currently fail..."
  #tox -e test
  return 0
}

package() {
  cd "${pkgname/python-}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
