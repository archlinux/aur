# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_name=${pkgname#python-}
pkgver=0.16.0
pkgrel=1
pkgdesc="A library of Python tools and extensions for data science."
arch=(any)
url="https://github.com/rasbt/mlxtend"
license=('BSD')
groups=()
depends=('python')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('7f5784f6a05f3db2ff91c3e01783178d')
sha256sums=('86e14a6af1f61c851b032b7983c566a970af9732245f5d7a535b70b0979684c6')
sha512sums=('f6a8072e02ada162c130f82f80afb30c6600d2907c95d3f750b37e42de592ad7c99caeae7d50d0cc1f74a3987cb0a83aef8e212f301447ea831c7bdaca887a3c')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
