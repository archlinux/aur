# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-pysmb
_pypi_pkgname=pysmb
pkgver=1.2.6
pkgrel=0
pkgdesc="An experimental SMB/CIFS library written in Python"
arch=(any)
url="https://miketeo.net/wp/index.php/projects/pysmb"
license=('ZLIB')
depends=('python' 'python-setuptools' 'python-pyasn1')
source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.zip")
sha256sums=('f16e5e796b9dcc1d17ee76f87d53dd471f205fa19b4045eeda5bc7558a57d579')

package() {
  cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
