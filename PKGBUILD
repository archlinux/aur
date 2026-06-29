# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=python-webrtcvad-wheels
pkgver=2.0.14
pkgrel=1
pkgdesc='Interface to the WebRTC Voice Activity Detector (VAD)'
arch=('any')
url='https://github.com/daanzu/py-webrtcvad-wheels'
license=('MIT')
depends=('python')
profides=('python-webrtcvad')
conflicts=('python-webrtcvad')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/28/ba/3a8ce2cff3eee72a39ed190e5f9dac792da1526909c97a11589590b21739/webrtcvad_wheels-$pkgver.tar.gz")
sha256sums=('5f59c8e291c6ef102d9f39532982fbf26a52ce2de6328382e2654b0960fea397')

package() {
  cd webrtcvad_wheels-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
