# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-kucoin"
pkgver=2.1.2
pkgrel=1
pkgdesc="Unofficial Python wrapper for KuCoin's API"
arch=('any')
url="https://github.com/sammchardy/$pkgname"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9167b0f832d54400d4ad7eecbdd6cc4060f7fa3bad4b14ecb9413829a29c3a6e')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
