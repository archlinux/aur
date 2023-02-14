# Maintainer: Bruce Zhang <zttt183525594@gmail.com>

pkgname=feeluown-bilibili
epoch=1
pkgver=0.1.4
pkgrel=1
pkgdesc="Bilibili provider for FeelUOwn"
arch=('any')
url="https://github.com/BruceZhang1993/feeluown-bilibili"
license=('GPL3')
depends=('feeluown' 'python-cachetools' 'python-beautifulsoup4' 'python-pycryptodomex')
makedepends=('python-setuptools' 'python-pip')
source=("https://pypi.io/packages/source/f/feeluown_bilibili/feeluown-bilibili-$pkgver.tar.gz")
sha512sums=('264ef90ea525c4187e1d8d8f3a81447ef130892b7272bb730569cd1036ecb3468d8485575cbe3ae5571fd305708f27e1764da4c4589015c05cb6a8664260fc26')

build() {
  cd feeluown-bilibili-$pkgver
  python setup.py build
}

package() {
  cd feeluown-bilibili-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
