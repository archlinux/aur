# Maintainer: Bruce Zhang <zttt183525594@gmail.com>

pkgname=feeluown-bilibili
epoch=1
pkgver=0.1.1
pkgrel=1
pkgdesc="Bilibili provider for FeelUOwn"
arch=('any')
url="https://github.com/BruceZhang1993/feeluown-bilibili"
license=('GPL3')
depends=('feeluown' 'python-cachetools' 'python-beautifulsoup4' 'python-pycryptodomex')
makedepends=('python-setuptools' 'python-pip')
source=("https://pypi.io/packages/source/f/feeluown_bilibili/feeluown-bilibili-$pkgver.tar.gz")
sha512sums=('b14f84c8785ec7a792fe39fe92ed7f6f1316a87b5c8042d427ad0bb8d82ac3631bdd2f82933b1a11833e45dc04246491e853242f838a244877c4cf9392bac5a9')

build() {
  cd feeluown-bilibili-$pkgver
  python setup.py build
}

package() {
  cd feeluown-bilibili-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
