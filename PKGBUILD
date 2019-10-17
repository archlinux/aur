# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
pkgname=python-sphinxcontrib-programoutput
_pkgname=sphinxcontrib-programoutput
pkgver=0.15
pkgrel=1
pkgdesc="Sphinx extension to include program output"
arch=('any')
url="https://bitbucket.org/birkenfeld/sphinx-contrib"
license=('BSD')
depends=('python' 'python-sphinx')
makedepends=('python')
provides=('sphinxcontrib-programoutput')
options=(!emptydirs)
source=(
  "https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
)
sha256sums=('80dd5b4eab780a13ff2c23500cac3dbf0e04ef9976b409ef25a47c263ef8ab94')
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
