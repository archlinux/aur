# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pygexf
_pypiname=pygexf
pkgver=0.2.2
pkgrel=1
pkgdesc="A python library to generate gexf file format"
url="https://github.com/paulgirard/pygexf"
arch=('any')
license=('LGPL')
depends=('python')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/paulgirard/pygexf/archive/v${pkgver}.tar.gz")
sha256sums=('fabb298582ba05be175704dbf7d9371f68065cda737ce94390ba09b9cdfdf842')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
