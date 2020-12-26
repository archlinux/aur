# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild [at] gadz [at] org>

pkgname=python-mlxtend
_name=${pkgname#python-}
pkgver=0.18.0
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
md5sums=('1061b8c3eed806817bec28be6f86a41b')
sha256sums=('42965827a58d91f218b35a394881b45025a5c023ef8e595825bc97c955f9256c')
sha512sums=('cf72b4cf60bcc550da3aa9658ba64d6bcd7f034cab6f55634f4b25cfe834723a066980edecde24942fdc342c1c7ca50db8a4cb7a2b726e6dbaf07e249c3c4916')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
