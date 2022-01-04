# Maintainer: Tomas Krizek <tomas.krizek@mailbox.org>
_pkgname=websharecli
pkgname=python-${_pkgname}
pkgver=2.2.0
pkgrel=1
pkgdesc="CLI utility to download from webshare.cz"
arch=('any')
url="https://github.com/tomaskrizek/${_pkgname}"
license=('GPL3')
depends=(
  'python'
  'python-blessings'
  'python-requests'
  'python-setuptools'
  'python-xmltodict'
  'python-yaml'
)
source=("https://github.com/tomaskrizek/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('acf1f7a7f1c2744f3606c37fba88a6966dfca91565e02ec2d108a413034a6061')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}
