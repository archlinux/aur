# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.55.1
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks. (Formerly Spotmop)'
arch=('any')
url="https://github.com/jaedb/${_pkgname}"
license=('APACHE')
depends=('mopidy>=3' 'python-configobj' 'python-pylast')
makedepends=('python-setuptools' 'python-pip')
optdepends=('mopidy-local: local library support'
            'mopidy-spotify: spotify support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jaedb/Iris/archive/${pkgver}.tar.gz")
sha256sums=('d4f3e59533c6f54d1b68a10a5be3d2fc01c3fe86fa2865b88786b5be8b5b7036')

package() {
  cd "${srcdir}/Iris-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

