# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_name=${pkgname#python-}
pkgver=0.15.0
_ver=${pkgver}.0
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${_ver}.tar.gz")
md5sums=('84290053b926ecf6af9b60c7e3519a15')
sha256sums=('f59cadf199563fdaa0bfeff2327de4dc49571c22f92140ed0e5e1135723aded9')
sha512sums=('dcbf52d52b88254285720215cff2b12fac11d7503dffecd6368af19f9278f31f6ebf56ada33bd23be4971e341702dc3d2060fc603ab47eb17e37479361a05c4c')

package() {
  cd "${srcdir}/${_name}-${_ver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
