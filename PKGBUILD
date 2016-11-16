# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

pkgname=mopidy-spotmop
_pkgname=spotmop
pkgver=2.10.1
pkgrel=3
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks.'
arch=('any')
url="https://github.com/jaedb/spotmop"
license=('APACHE')
depends=('python2' 'mopidy>=0.19' 'mopidy-spotify' 'python2-configobj' 'mopidy-local-images' 'python2-spotipy' 'python2-pylast')
makedepends=('python2' 'python2-setuptools')
optdepends=('mopidy-local-sqlite: local library support')
source=("https://github.com/jaedb/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('8b0b2a0e707f26caadd811165b5a0da8')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
