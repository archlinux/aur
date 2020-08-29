# Maintainer: Ellis Kenyo <me at elken dot dev>

pkgname=python-xxh
pkgver=0.8.3
pkgrel=1
pkgdesc="Take your shell with you!"
arch=('x86_64')
url="https://pypi.org/project/xxh-xxh/"
depends=('python' 'python-pexpect' 'python-setuptools')
makedepends=()
license=('BSD')
source=($pkgname-$pkgver::https://github.com/xxh/xxh/archive/$pkgver.tar.gz)
md5sums=('087c20533d18c937cb2a753f770aa1bb')

package() {
  cd "$srcdir"/$(echo $pkgname | cut -d- -f2)-$pkgver
  python setup.py install --root="$pkgdir"
}

