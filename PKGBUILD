# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=e74a022a5f5cdc6c640e6d38654f9d594e81ae3d
pkgname=deemix
pkgver=1.0.19
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('c92dec2981f03c38517df464c0c4299ac6c40aa7fabf9f1ff2bdbdf6e4604797')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
