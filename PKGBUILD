# Maintainer: Tomas Krizek <tomas.krizek@mailbox.org>
_pkgname=websharecli
pkgname=python-${_pkgname}
pkgver=2.0.0
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
sha256sums=('e9a30a18fe24be433652cb4e463ee3e720fac702f1df8021cf5448c1dff23ac6')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}
