# Maintainer: Yaron de Leeuw <jdlmail at gmail >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-natsort
_pkgname=natsort
pkgver=3.4.1
pkgrel=1
pkgdesc="Natural sorting for python"
arch=('any')
url="https://github.com/SethMMorton/natsort"
license=('MIT')
depends=('python')
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('4744e3831ed1b62255cd9b0658ce109a')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

