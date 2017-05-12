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
sha256sums=('49304b30fc45f37845f11b4c655f0aee00bc58023dda205dcb837f9b6ce2cbc1')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
