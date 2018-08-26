# Maintainer: kodemeister <kodemeister@outlook.com>

pkgname=compdb
pkgver=0.2.0
pkgrel=1
pkgdesc="The compilation database Swiss army knife"
arch=("any")
url="https://github.com/Sarcasm/$pkgname"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("$pkgname-git")
source=("https://github.com/Sarcasm/$pkgname/archive/v$pkgver.tar.gz")
md5sums=("6cc607c8a0822862a69ef0b507ba21cf")
sha256sums=("bfa945f924678b701f1311098f24d9a4d0358a874913c55698a8acbb7047ac67")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
