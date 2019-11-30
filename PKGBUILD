# Maintainer: Tomas Krizek <tomas.krizek@mailbox.org>
_pkgname=websharecli
pkgname=python-${_pkgname}
pkgver=1.1.1
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
sha256sums=('f1f075b5648dfa841407d19e8ed402914a8c4f20d6866b9da7718053594af901')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build install --root="${pkgdir}"
}
