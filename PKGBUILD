# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
pkgname=python-sphinxcontrib-programoutput
_pkgname=sphinxcontrib-programoutput
pkgver=0.11
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
source=(https://pypi.python.org/packages/25/34/fd1b61d3fe9ea705dff169d55426bf23d8be0f7b1976d17e79fbcc16e7d9/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('cbec3ee1c3abd09e105115ab69cb5ade8ca1be9811565a844f973e93e0314837')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
