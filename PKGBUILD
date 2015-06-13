# Maintainer: Scott Moak <scott dot moak at gmail dot com>

pkgname=mopidy-musicbox
_pypiname=Mopidy-MusicBox-Webclient
pkgver=1.0.1
pkgrel=1
pkgdesc="Web Client for Mopidy Music Server and the Pi MusicBox"
arch=('any')
url="https://github.com/woutervanwijk/Mopidy-MusicBox-Webclient"
license=('APACHE')
depends=('python2' 'mopidy>=0.19')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('6a709cb058a6d30beb86e5204a8441b3')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
