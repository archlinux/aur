# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=python-gtts
pkgver=2.2.3
pkgrel=1
pkgdesc="Module and command line utility to save spoken text to mp3 via the Google Text to Speech (TTS) API "
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python-six' 'python-click' 'python-requests')
makedepends=('python-setuptools')
source=("https://github.com/pndurette/gTTS/archive/v${pkgver}.tar.gz")
md5sums=('027b5185926833e2ed85b09f98f02d96')

build() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
