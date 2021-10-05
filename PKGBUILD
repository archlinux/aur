# Maintainer: Asthowen <contact@asthowen.fr>

pkgname='python-mangasorigines'
pkgver=0.0.6
pkgrel=1
pkgdesc="An API wrapper for MangasOrigines written in Python."
arch=('any')
url='https://github.com/Asthowen/MangasOrigines/'
license=('GNUv3')
makedepends=('python-setuptools')
depends=('python>=3.6' 'python-aiohttp' 'python-aiofiles' 'python-beautifulsoup4')
source=("https://pypi.io/packages/source/M/MangasOrigines/MangasOrigines-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd MangasOrigines-$pkgver
  python setup.py build
}

package() {
  cd MangasOrigines-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}