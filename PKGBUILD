# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=aa68190caa8dbe1b5d9d6c23328c37e9fcfd78ed
pkgname=deemix
pkgver=1.1.8
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('6b41ae50bdb52d07e25f971cdaaddaecf30da06644be9fd2d440a61a6f200c29')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
