# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-split
pkgver=0.4
pkgrel=8
pkgdesc="Functions to split or partition sequences"
arch=('any')
url="https://bitbucket.org/astanin/python-split"
license=('MIT')
depends=('python')
source=("https://pypi.io/packages/source/s/split/split-$pkgver.zip")
sha256sums=('c4be970a857d605d94999da18779bc10c34a34f937dede983268de3877b81faa')

package() {
  cd split-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
