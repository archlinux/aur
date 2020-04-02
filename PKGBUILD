# Maintainer: Ellis Kenyo <me at elken dot dev>

pkgname=python-xxh
pkgver=0.7.9
pkgrel=1
pkgdesc="Take your shell with you!"
arch=('x86_64')
url="https://pypi.org/project/xxh-xxh/"
depends=('python' 'python-pexpect')
makedepends=()
license=('BSD')
source=($pkgname-$pkgver::https://github.com/xxh/xxh/archive/$pkgver.tar.gz)
md5sums=('55ec5a5aaf0a3092d9adfc1aa7e59e69')

package() {
  cd "$srcdir"/$(echo $pkgname | cut -d- -f2)-$pkgver
  python setup.py install --root="$pkgdir"
}

