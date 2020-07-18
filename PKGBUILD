# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=ccce111a8595e18bec370c9aadae5f91a51aab65
pkgname=deemix
pkgver=1.1.10
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('f86ae7508fe5250dbfed87aeb3c54d2be2bac3c3ff9fe533dc097fe2c4948216')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
