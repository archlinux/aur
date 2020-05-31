# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=689131253351df805bb705257c62ba39fe09758c
pkgname=deemix
pkgver=1.0.7
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('5237591425b48be2f3750f501225680194c4676c2b3d80efe9c45cf424462ed6')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
