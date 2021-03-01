# Maintainer: Tomas Krizek <tomas.krizek@mailbox.org>
_pkgname=websharecli
pkgname=python-${_pkgname}
pkgver=2.0.2
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
sha256sums=('d6e3da00e7df16766e1d680e740f7c0a2a794d0c563a7706ff071f41781433fe')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}
