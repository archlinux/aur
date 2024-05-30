# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

pkgname=python-zenmoney
pkgver=0.9
pkgrel=3
pkgdesc='Python library for ZenMoney API'
arch=('any')
url="https://github.com/Felixoid/python-zenmoney"
makedepends=('python-setuptools')
depends=('python' 'python-requests')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3f8853f0aa29f75aaaec4543fbc6325e2c60bc5b7393b6e0d30867a379766eed')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
