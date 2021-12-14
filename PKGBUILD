# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-pysmb
_pypi_pkgname=pysmb
pkgver=1.2.7
pkgrel=1
pkgdesc="An experimental SMB/CIFS library written in Python"
arch=(any)
url="https://miketeo.net/wp/index.php/projects/pysmb"
license=('ZLIB')
depends=('python' 'python-setuptools' 'python-pyasn1')
source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.zip")
sha256sums=('298605b8f467ce15b412caaf9af331c135e88fa2172333af14b1b2916361cb6b')

package() {
  cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
