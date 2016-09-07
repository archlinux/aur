# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

pkgname=mopidy-spotmop
_pkgname=spotmop
pkgver=2.9.1
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks.'
arch=('any')
url="https://github.com/jaedb/spotmop"
license=('APACHE')
depends=('python2' 'mopidy>=0.19' 'mopidy-spotify' 'python2-configobj')
makedepends=('python2' 'python2-setuptools')
source=("https://github.com/jaedb/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('c81bea4bc57dfe1b375bdbfb5c1ae695')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
