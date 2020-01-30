# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.44.0
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks. (Formerly Spotmop)'
arch=('any')
url="https://github.com/jaedb/${_pkgname}"
license=('APACHE')
depends=('python' 'mopidy>=3' 'mopidy-spotify' 'python-configobj'
         'mopidy-local-images' 'python-pylast')
makedepends=('python' 'python-setuptools' 'python-pip')
optdepends=('mopidy-local-sqlite: local library support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jaedb/Iris/archive/${pkgver}.tar.gz")
sha256sums=('292f955d4f115f5dbd70ff088a2b2355c5e27402c281035191793a292a22aa8a')

package() {
  cd "${srcdir}/Iris-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

