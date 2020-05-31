# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=a62b95dd76e8ba73f00588c328f394fee2784929
pkgname=deemix
pkgver=1.0.8
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('7118d2ebf170fd6b2591f1aaa39c7ebabe52cc8eae4dced9c063177614bf3cba')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
