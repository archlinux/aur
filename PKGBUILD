# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-atpublic')
pkgver=0.5
pkgrel=1
pkgdesc="@public for populating __all__"
arch=(any)
url="https://gitlab.com/warsaw/public"
license=('APACHE')
options=(!emptydirs)
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/warsaw/public/-/archive/${pkgver}/public-${pkgver}.tar.gz")
sha256sums=('56b7878c84c90a6f95c24ddb5a71950a5f6024c4e4f143256bca8b57680bdc9b')

package() {
  cd "${srcdir}/public-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
