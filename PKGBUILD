# Maintainer: Ellis Kenyo <me at elken dot dev>

pkgname=python-xxh
pkgver=0.8.10
pkgrel=1
pkgdesc="Take your shell with you!"
arch=('x86_64')
url="https://pypi.org/project/xxh-xxh/"
depends=('python' 'python-pexpect' 'python-setuptools')
makedepends=()
license=('BSD')
source=($pkgname-$pkgver::https://github.com/xxh/xxh/archive/$pkgver-release2.tar.gz)
md5sums=('01d01eac0b74cb072b0f0f2a4c480be0')

package() {
  cd "$srcdir"/$(echo $pkgname | cut -d- -f2)-$pkgver-release2
  python setup.py install --root="$pkgdir"
}

