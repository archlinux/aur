# Maintainer: kodemeister <kodemeister@outlook.com>

pkgname=compdb
pkgver=0.1.1
pkgrel=2
pkgdesc="The compilation database Swiss army knife"
arch=("any")
url="https://github.com/Sarcasm/$pkgname"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("$pkgname-git")
source=("https://github.com/Sarcasm/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("7e6c2cade127fa64c4772d639641a50f")
sha256sums=("1b630fad573e8e4e8e60b77e6f7e7fe1186eb228c47ccbeb21969aebae46e69d")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
