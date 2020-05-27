# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=47f728e172e3a69e324173acebaad4f7f438b7a2
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
sha256sums=('0316424e5fe844877312ff1170a2a015872d1b9cb8281938aac086c86dd5b7c9')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
