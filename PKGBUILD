# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=d8fdc8344fe927934403dad4893a76dccd69b197
pkgname=deemix
pkgver=1.1.5
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('d995c9014d2a9c99c8bae1c344ee6bc900ffac75bbdd3640657402e50927cd46')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
