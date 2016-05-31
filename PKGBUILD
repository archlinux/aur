# Maintainer: Scott Moak <scott dot moak at gmail dot com>

pkgname=mopidy-musicbox
_pypiname=Mopidy-MusicBox-Webclient
pkgver=2.3.0
pkgrel=1
pkgdesc="Web Client for Mopidy Music Server and the Pi MusicBox"
arch=('any')
url="https://github.com/woutervanwijk/Mopidy-MusicBox-Webclient"
license=('APACHE')
depends=('python2' 'mopidy>=0.19')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/a5/8c/cd6ca5d968dd21f1b5b238d64244ea822753f876b237c84aecf2519b7cda/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('a602eff0fa9c0948122ccc95e59b4284aa46aafc05267bfa5995ab119ed88ac0')

package() {
  cd "${srcdir}/${_pypiname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
