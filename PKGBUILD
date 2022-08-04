# Maintainer: Bruce Zhang <zttt183525594@gmail.com>

pkgname=feeluown-bilibili
epoch=1
pkgver=0.1.2
pkgrel=1
pkgdesc="Bilibili provider for FeelUOwn"
arch=('any')
url="https://github.com/BruceZhang1993/feeluown-bilibili"
license=('GPL3')
depends=('feeluown' 'python-cachetools' 'python-beautifulsoup4' 'python-pycryptodomex')
makedepends=('python-setuptools' 'python-pip')
source=("https://pypi.io/packages/source/f/feeluown_bilibili/feeluown-bilibili-$pkgver.tar.gz")
sha512sums=('8f15fbaf8b56489d7083893cd334edb3b6c0b72a5edabad1cac3a8142782e36939688049735c1d9014c652ee7002bfebc547b0c2cd125b7d679eaaa84e950b09')

build() {
  cd feeluown-bilibili-$pkgver
  python setup.py build
}

package() {
  cd feeluown-bilibili-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
