# Maintainer: Tomas Krizek <tomas.krizek@mailbox.org>
_pkgname=websharecli
pkgname=python-${_pkgname}
pkgver=2.1.0
pkgrel=1
pkgdesc="CLI utility to download from webshare.cz"
arch=('any')
url="https://github.com/tomaskrizek/${_pkgname}"
license=('GPL3')
depends=(
  'python'
  'python-requests'
  'python-setuptools'
  'python-xmltodict'
  'python-yaml'
)
source=("https://github.com/tomaskrizek/${_pkgname}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ed9b64d6ca7035eb12d78751de6efb84e73635675440b5ac06e1523c9e83cb5f')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}
