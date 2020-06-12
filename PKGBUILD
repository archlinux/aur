# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=e19b33954bab851764fe759f654e3d37cb228c3f
pkgname=deemix
pkgver=1.0.18
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('00024f775cc8d1f37f7b87f78fbd937cfbcefac261f0413136a477456b4e7db1')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
