# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-atpublic')
_commit=33dfd1ff89a5d9c1942424b1642eaa77327f7dde
pkgver=0.5
pkgrel=1
pkgdesc="@public for populating __all__"
arch=(any)
url="https://gitlab.com/warsaw/public"
license=('APACHE')
options=(!emptydirs)
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/warsaw/public/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('ed0d6470ecc35b751072120870a97517dd21c3e49054a9d08d8ee4f9f9f592a9')

package() {
  cd "${srcdir}/public-${pkgver}-${_commit}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
