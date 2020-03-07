# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_name=${pkgname#python-}
pkgver=0.17.2
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
sha256sums=('de12751e980f11927a460556876d6e4e552f3de916a99372d7ba7572784ed4a0')
sha512sums=('c20b9b1c16c1798aea12b505739f46f0d29366f23a1ff2a994bceeb63dcba4865ed126af811984a7fc9a7076231519170662c1c7dcc9c72156a1a662dc1866f2')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
