# Maintainer: Apple_QAQ <apple_qaq@outlook.com>

pkgname=python-bilibili-api
pkgver=13.1.1
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/Nemo2011/bilibili-api"
license=('GPL3')
depends=('feeluown' 'python-aiohttp' 'python-beautifulsoup4' 'python-colorama' 'python-yaml' 'python-brotli' 'python-yarl' 'python-lxml')
makedepends=('python-setuptools' 'python-pip')
source=("https://pypi.io/packages/source/b/bilibili-api-python/bilibili-api-python-$pkgver.tar.gz")
sha512sums=('af541701114364f419d910fea736cfce6b2656f8d98e3f4b5151dd9925973379efe7c00bb67553d4e498e21e8ffdf967e651df0d3399d359ec1319a9a437d414')

build() {
  cd bilibili-api-$pkgver
  python setup.py build
}

package() {
  cd bilibili-api-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}