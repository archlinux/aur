# Maintainer: Yaron de Leeuw <jdlmail at gmail >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-natsort
_pkgname=natsort
pkgver=3.2.0
pkgrel=1
pkgdesc="Natural sorting for python"
arch=('any')
url="https://github.com/SethMMorton/natsort"
license=('MIT')
depends=('python')
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('f8fa83a534e7907f1f1a5e4efd0523f9')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

