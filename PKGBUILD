# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.54.2
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
sha256sums=('cd8910b7b60d36c4d80aef6fea50789ba5fae7f59cdcac403ad40f428ce4d00a')

package() {
  cd "${srcdir}/Iris-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

