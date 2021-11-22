# Maintainer: Bruce Zhang <zttt183525594@gmail.com>

pkgname=python-bilibili-api
pkgver=9.0.2
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/MoyuScript/bilibili-api"
license=('GPL3')
depends=('feeluown' 'python-aiohttp' 'python-beautifulsoup4' 'python-colorama' 'python-yaml' 'python-brotli' 'python-yarl' 'python-lxml')
makedepends=('python-setuptools' 'python-pip')
source=("https://pypi.io/packages/source/b/bilibili-api/bilibili-api-$pkgver.tar.gz")
sha512sums=('0f4967318aa30ce94b8a665fe2c83ea8a12c804841ebb98da6d817ce026ebea81edaa31a43961add9c848ad724cc51fca635a8228e174940e9921be6e45a3732')

build() {
  cd bilibili-api-$pkgver
  python setup.py build
}

package() {
  cd bilibili-api-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
