# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_name=${pkgname#python-}
pkgver=0.17.0
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
sha256sums=('273d62f12398d449f6ff8d0b89a18a798f9f75f6d60570acd3d513d8eaeeadbc')
sha512sums=('3bd654cb7fbacc42a344f7e63a27cdd7096af38b2530717516c92dd9a2e4822e36f7d63f8100d48e8d9a206276cf4741bba24a9f75c884db1c5a5b61aa36a314')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
