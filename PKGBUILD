# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.44.3
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
sha256sums=('0f4f3249e78d8dad0347d5e56439d880a4010843e770387fdef4f92bc812d44c')

package() {
  cd "${srcdir}/Iris-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

