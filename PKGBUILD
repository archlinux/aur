# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=python-gtts
pkgver=2.2.2
pkgrel=1
pkgdesc="Module and command line utility to save spoken text to mp3 via the Google Text to Speech (TTS) API "
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python-six' 'python-click' 'python-requests' 'python-gtts-token')
makedepends=('python-setuptools')
source=("https://github.com/pndurette/gTTS/archive/v${pkgver}.tar.gz")
md5sums=('e31ce0e4fcd97944739f5b91931e4d25')

build() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
