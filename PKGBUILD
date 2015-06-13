# Maintainer: Scott Moak <scott dot moak at gmail dot com>

pkgname=mopidy-musicbox
_pypiname=Mopidy-MusicBox-Webclient
pkgver=2.0.0
pkgrel=1
pkgdesc="Web Client for Mopidy Music Server and the Pi MusicBox"
arch=('any')
url="https://github.com/woutervanwijk/Mopidy-MusicBox-Webclient"
license=('APACHE')
depends=('python2' 'mopidy>=0.19')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('acc5e3ac183032865430af400ac6c9dbc38bcd947231c70114232a2a2858f82d')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
