# Maintainer: Yaron de Leeuw < me@jarondl.net  >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-natsort
_pkgname=natsort
pkgver=3.5.2
pkgrel=1
pkgdesc="Natural sorting for python"
arch=('any')
url="https://pypi.python.org/pypi/natsort"
license=('MIT')
depends=('python')
makedepends=(python-setuptools)
source=("https://pypi.python.org/packages/source/n/natsort/natsort-${pkgver}.tar.gz")
sha512sums=('cc9004f12e3097812045da5cf7bd7ea146875044e43bea21f0ca5afe8487d7a7c399d46c14e89366fa126b9b517e43561d08bd12cdd2a58de7a6b261b71d1eaf')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

