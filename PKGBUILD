# Maintainer: Yaron de Leeuw < me@jarondl.net  >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-natsort
_pkgname=natsort
pkgver=4.0.0
pkgrel=1
pkgdesc="Natural sorting for python"
arch=('any')
url="https://pypi.python.org/pypi/natsort"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/n/natsort/natsort-${pkgver}.tar.gz")
sha512sums=('bf22c0b3a31fb9eeb89e820a3eb2ed50a3c12445c7947daa16ee2fd74d619ec157d49a4045e30d4e103d74c02047f1e5329529f76ce1248eafe76fbf4b325a28')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

