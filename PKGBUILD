# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-webrtcvad-wheels'
_name=${pkgname#python-}
pkgver=2.0.10
_subver='post2'
pkgrel=2
pkgdesc='Interface to the WebRTC Voice Activity Detector (VAD).'
arch=('any')
url='https://github.com/daanzu/py-webrtcvad-wheels'
license=('MIT')

makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.${_subver}.tar.gz")
sha256sums=('151bf3998fb731afff90dba77808326235370a6bb467a2d1b81345b10d1de10d')

package() {
  cd webrtcvad-wheels-${pkgver}.${_subver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
