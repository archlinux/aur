# Maintainer: evertonstz

pkgname=mopidy-spotmop
_pypiname=Mopidy-Spotmop
pkgver=2.5.4
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks.'
arch=('any')
url="https://github.com/jaedb/spotmop"
license=('APACHE')
depends=('python2' 'mopidy>=0.19' 'mopidy-spotify')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('8fb5d108c221d2e7fa57fac81894efab')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
