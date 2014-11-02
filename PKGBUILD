# Maintainer: Yaron de Leeuw < me@jarondl.net  >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-natsort
_pkgname=natsort
pkgver=3.5.1
pkgrel=1
pkgdesc="Natural sorting for python"
arch=('any')
url="https://pypi.python.org/pypi/natsort"
license=('MIT')
depends=('python')
makedepends=(python-setuptools)
source=("https://pypi.python.org/packages/source/n/natsort/natsort-${pkgver}.tar.gz")
md5sums=('e5c00646244c2186d7c19e2f8047a003')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

