# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=8673084639b6b67accf57894516e1bbfae4710e2
pkgname=deemix
pkgver=1.0.15
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('08ae8f49e70ce1fa17b36c91f718026a00d6fa412039729255c828b7e5f08ea1')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
