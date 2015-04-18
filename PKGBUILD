# Maintainer: Yaron de Leeuw < me@jarondl.net  >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-natsort
_pkgname=natsort
pkgver=3.5.6
pkgrel=1
pkgdesc="Natural sorting for python"
arch=('any')
url="https://pypi.python.org/pypi/natsort"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/n/natsort/natsort-${pkgver}.tar.gz")
sha512sums=('62e44cc735975d9d28aa0e11a73a9326c63f33327622fb5d0b4d9b90825c228739c7313b5e5c667d63c9a477af185e4725aa8552ad767e292cf65bb55d874508')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

