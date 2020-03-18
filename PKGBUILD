# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.46.0
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
sha256sums=('6e9187f862c1ee33dec4be92fc45e4a0b716adac9b07352a626f54b461505633')

package() {
  cd "${srcdir}/Iris-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

