# Maintainer: Ellis Kenyo <me at elken dot dev>

pkgname=python-xxh
pkgver=0.8.11
pkgrel=1
pkgdesc="Take your shell with you!"
arch=('x86_64')
url="https://pypi.org/project/xxh-xxh/"
depends=('python' 'python-pexpect' 'python-setuptools' 'python-yaml')
makedepends=()
license=('BSD')
source=($pkgname-$pkgver::https://github.com/xxh/xxh/archive/refs/tags/$pkgver.zip)
md5sums=('b7a5bb2e20b36aef60165f5c3c16e8ac')

package() {
  cd "$srcdir"/$(echo $pkgname | cut -d- -f2)-$pkgver
  python setup.py install --root="$pkgdir"
}
