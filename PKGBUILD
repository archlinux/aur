# Maintainer: Pierre-Nick Durette <pndurette at gmail dot com>
# Contributor: Tembleking <tembleking at gmail dot com>

pkgname=python-gtts
pkgver=2.0.1
pkgrel=1
pkgdesc="Module and command line utility to save spoken text to mp3 via the Google Text to Speech (TTS) API "
arch=('any')
url="https://github.com/pndurette/gTTS"
license=('MIT')
depends=('python' 'python-gtts-token' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/52/6e/ae8bd869f7166ab541721e9af7b31d7e54901ce96622620e23e2ae141055/gTTS-2.0.1.tar.gz")
md5sums=('a74588d23840f07badb195bda8138b2d')

build() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/gTTS-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
