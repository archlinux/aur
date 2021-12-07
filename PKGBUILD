# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.60.0
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
sha256sums=('f4b892a7f1ba2d3700033b3e1ee47046a04aa3ea3e2fcf54d417d9df2bc686a3')

package() {
  cd "${srcdir}/Mopidy-Iris-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

