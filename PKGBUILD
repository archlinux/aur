# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-split
pkgver=0.4
pkgrel=4
pkgdesc="Functions to split or partition sequences"
arch=('any')
url="https://bitbucket.org/astanin/python-split"
license=('MIT')
depends=('python')
source=("https://pypi.io/packages/source/s/split/split-$pkgver.zip")
md5sums=('16e72d45b66b0f8da2349be0f82d5216')

package() {
  cd split-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
