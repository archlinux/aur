# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_name=${pkgname#python-}
pkgver=0.17.1
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
sha256sums=('2e60c89d3826bb29abfbb3c512dd9981e4111d133a21f49d6410188e5e2cd06c')
sha512sums=('920c23011efeaa7b51a9a4678f3510443df258135997440599cc43c18c9237f23fb66013d22999a76c964641a200e2a0c7d8e53ec8cb4304b0812aaaf6751353')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
