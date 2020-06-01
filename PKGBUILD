# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=6e01f38765f185b981df2c5bf054cc17cde8ab90
pkgname=deemix
pkgver=1.0.9
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('dab390ec6964b3ae3ae1228bf972db1e70bf5595b9b596c4d2a74aa80bc6f060')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
