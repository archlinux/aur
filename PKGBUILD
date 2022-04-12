# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-kucoin"
pkgver=2.1.3
pkgrel=1
pkgdesc="Unofficial Python wrapper for KuCoin's API"
arch=('any')
url="https://github.com/sammchardy/$pkgname"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('94d8e7112d53c9474a07b0f9173a0f2e7091d90bbbcae892d35ae417139c9cd7')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
