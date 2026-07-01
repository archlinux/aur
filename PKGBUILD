# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=python-webrtcvad-wheels
pkgver=2.0.14
pkgrel=2
pkgdesc="Interface to the WebRTC Voice Activity Detector (VAD)"
url="https://github.com/daanzu/py-webrtcvad-wheels"
license=('MIT')
arch=('any')
depends=('python')
provides=('python-webrtcvad')
conflicts=('python-webrtcvad')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c10a07b3197f218c54f2f6513cb43b8067f1ddd361c767bf3f31ce5788b6df0a')

package() {
  cd py-webrtcvad-wheels-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
