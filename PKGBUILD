# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=6cf890f7cde1ecd925c07bcd6d9714c83148e359
pkgname=deemix
pkgver=1.1.9
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('cf8a93e6a508a5b9d36e9b13fc9e4722f317ebc9fe5178fc971968bc97ccdafd')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
