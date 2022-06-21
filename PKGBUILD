# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=audio-to-midi
pkgver=2020.7
pkgrel=1
pkgdesc="Convert audio to multichannel MIDI."
arch=('any')
url="https://github.com/NFJones/audio-to-midi"
license=('MIT')
depends=('python-cffi' 'cython'
         'python-numpy' 'python-pycparser'
         'python-soundfile' 'python-midi')
makedepends=('python-setuptools')
source=("git+${url}#tag=v${pkgver}")
md5sums=(SKIP)

package() {
  cd $pkgname
  python3 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
