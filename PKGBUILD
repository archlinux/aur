# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=e478e5b031238fb1a30e6267f5af7b94f0a397ef
pkgname=deemix
pkgver=1.0.26
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('9828ff86ebc3e3c27785d12718bb2e988e34291db4e7091e636c42322a69ee6b')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
