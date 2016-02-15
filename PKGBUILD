# Maintainer: Scott Moak <scott dot moak at gmail dot com>

pkgname=mopidy-musicbox
_pypiname=Mopidy-MusicBox-Webclient
pkgver=2.1.1
pkgrel=1
pkgdesc="Web Client for Mopidy Music Server and the Pi MusicBox"
arch=('any')
url="https://github.com/woutervanwijk/Mopidy-MusicBox-Webclient"
license=('APACHE')
depends=('python2' 'mopidy>=0.19')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('a56a2312fe02c72b954a4ae90ee536f16833bfd77197e7df8a2e7f684679c4fc')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
