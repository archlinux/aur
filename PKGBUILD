# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=2.10.12
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks. (Formerly Spotmop)'
arch=('any')
url="https://github.com/jaedb/${_pkgname}"
license=('APACHE')
depends=('python2' 'mopidy>=0.19' 'mopidy-spotify' 'python2-configobj' 'mopidy-local-images' 'python2-spotipy' 'python2-pylast')
makedepends=('python2' 'python2-setuptools')
optdepends=('mopidy-local-sqlite: local library support')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('b86f62fc7830236ee8d366da48ed278e192a2f5522c26b62c1f4933df3ae9468')

package() {
  cd "${srcdir}/Iris-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
