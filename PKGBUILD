# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-adblockparser 
_pypiname=adblockparser
pkgver=0.7
pkgrel=1
pkgdesc="A package for working with Adblock Plus filter rules. It can parse Adblock Plus filters and match URLs against them"
url="https://github.com/TypeError/secure.py/releases"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/scrapinghub/adblockparser/archive/${pkgver}.tar.gz")
sha256sums=('cb2378a5e704e9cf6efb0c4a9ea5dc43997beec95635f25fc94fae5971f9035c')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
