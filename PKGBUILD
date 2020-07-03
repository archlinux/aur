# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=309ac9bd1305f9c177197c38d1603302c1c58677
pkgname=deemix
pkgver=1.1.4
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('15f0c12c725b5697a95c2228f547f41103a816acfa13f66e155e34b4ad3ca195')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
