# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=c0dee07010eb8e6cf14e7a169fa53fa0814741ef
pkgname=deemix
pkgver=1.0.6
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('bd8712830cc6fc3f8d9a2dc4aa1d23c020be9c09d5b5272b58e1744d495c7948')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
