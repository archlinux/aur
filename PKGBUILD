# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

pkgname=mopidy-spotmop
_pkgname=spotmop
pkgver=2.8
pkgrel=2
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks.'
arch=('any')
url="https://github.com/jaedb/spotmop"
license=('APACHE')
depends=('python2' 'mopidy>=0.19' 'mopidy-spotify' 'python2-configobj')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/jaedb/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('cbb31a387216f0e53d3ca2d50f4d3631')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
