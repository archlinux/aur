# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=3d0f27b1070d92eaea5140a0d2d030f35b684e79
pkgname=deemix
pkgver=1.1.11
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('d1995ab7d15e48887c3937524c60f8dc8ff7cf3b86ad2754676c927f930e1f32')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
