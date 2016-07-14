# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

pkgname=mopidy-spotmop
_pkgname=spotmop
pkgver=2.7.3
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks.'
arch=('any')
url="https://github.com/jaedb/spotmop"
license=('APACHE')
depends=('python2' 'mopidy>=0.19' 'mopidy-spotify')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/jaedb/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('abbd12f84daf46cb76583ecc34f869bd')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
