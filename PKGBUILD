# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
pkgname=python-sphinxcontrib-programoutput
_pkgname=sphinxcontrib-programoutput
pkgver=0.14
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
sha256sums=('75b182e9e8cf7efe828cac2c351bb737b00a76bc3aa60fd1a9b2b7096e99c383')
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
