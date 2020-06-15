# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

_commit=2cce36f82dd7f6925f7ed55199e97388527fcbd1
pkgname=deemix
pkgver=1.0.21
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://deemix.app/'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy')
makedepends=('python-setuptools')
conflicts=('deemix-git')
source=("https://notabug.org/RemixDev/deemix/archive/$_commit.tar.gz")
sha256sums=('def16a9c381677a3d0d98fa193bab44fba2a1b70fbca189369265332b616fe52')

build() {
  cd deemix
  python setup.py build
}

package() {
  cd deemix
  python setup.py install --root="$pkgdir" --optimize=1
}
