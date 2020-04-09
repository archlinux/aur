# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
pkgname=python-sphinxcontrib-programoutput
_pkgname=sphinxcontrib-programoutput
pkgver=0.16
pkgrel=1
pkgdesc="Sphinx extension to include program output"
arch=('any')
url="https://pypi.org/project/sphinxcontrib-programoutput/"
license=('BSD')
depends=('python' 'python-sphinx')
makedepends=('python')
provides=('sphinxcontrib-programoutput')
options=(!emptydirs)
source=(
  "https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
)
sha256sums=('0caaa216d0ad8d2cfa90a9a9dba76820e376da6e3152be28d10aedc09f82a3b0')
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
