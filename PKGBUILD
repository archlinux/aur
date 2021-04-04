# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.57.4
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
sha256sums=('6724cfe381eb6bf300baeeca68b68d31f82b7dbc4b0741e5a9b25e059b80b1fe')

package() {
  cd "${srcdir}/Mopidy-Iris-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

