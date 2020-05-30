# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=4fa05ba9844629a690ce671c555902b9392dfe1c
pkgname=deemix
pkgver=1.0.4
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('33992eeafe6df9e1b3d1f170354a5bc8cdfd4256c636f3172be8053117aeb41c')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
