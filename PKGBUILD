# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>
# Contributor: phijor <mail [at] phijor [dot] me>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.64.0
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks. (Formerly Spotmop)'
arch=('any')
url="https://github.com/jaedb/${_pkgname}"
license=('APACHE')
depends=('mopidy>=3' 'python-configobj' 'python-pylast')
makedepends=('python-setuptools' 'python-pip')
optdepends=('mopidy-local: local library support'
            'mopidy-spotify: spotify support')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/M/Mopidy-Iris/Mopidy-Iris-${pkgver}.tar.gz")
sha256sums=('6c0b4de663e39abb6ecbad38fcf22bad04cc864fabfec31e273d5848df385d18')

package() {
  cd "${srcdir}/Mopidy-Iris-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
