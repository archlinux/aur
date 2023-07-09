# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-webrtcvad-wheels'
_name=${pkgname#python-}
pkgver=2.0.11.post1
pkgrel=1
pkgdesc='Interface to the WebRTC Voice Activity Detector (VAD).'
arch=('any')
url='https://github.com/daanzu/py-webrtcvad-wheels'
license=('MIT')

makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('aa1f749b5ea5ce209df9bdef7be9f4844007e630ac87ab9dbc25dda73fd5d2b7')

package() {
  cd webrtcvad-wheels-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
