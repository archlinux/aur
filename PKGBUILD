# Maintainer: Bruce Zhang <zttt183525594@gmail.com>

pkgname=feeluown-bilibili
epoch=1
pkgver=0.1.5
pkgrel=2
pkgdesc="Bilibili provider for FeelUOwn"
arch=('any')
url="https://github.com/BruceZhang1993/feeluown-bilibili"
license=('GPL3')
depends=('feeluown' 'python-cachetools' 'python-beautifulsoup4' 'python-pycryptodomex')
makedepends=('python-setuptools' 'python-pip')
source=("https://pypi.io/packages/source/f/feeluown_bilibili/feeluown_bilibili-$pkgver.tar.gz")
sha512sums=('e32b7ad1f9fa59fd5e61ab0b3863188c9348980ca083aed69a72655cc5ed06713d80949750038fe6646ee682c87a131feadbd8b2fcf174a37d91fa9c8a0f669d')

build() {
  cd feeluown_bilibili-$pkgver
  python setup.py build
}

package() {
  cd feeluown_bilibili-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
