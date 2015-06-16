# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: OramahMaalhur <oramahmaalhur@gmail.com>
# Contributor: mtorromeo

pkgname=python-oursql
pkgver=0.9.4
pkgrel=2
pkgdesc="new set of MySQL bindings for python3"
arch=('i386' 'x86_64')
url="https://launchpad.net/oursql"
license=('BSD')
depends=('python>=3.1' 'libmysqlclient')
makedepends=('python-setuptools')
source=("http://launchpad.net/oursql/py3k/py3k-$pkgver/+download/oursql-$pkgver.zip")
sha1sums=('fdc853d1020c227bd5bda08ecb368746d3ed5b6d')

package() {
  cd "$srcdir/oursql-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  install -dm755 "$pkgdir/usr/share/licenses/python-oursql"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/python-oursql"
}

# vim:set ts=2 sw=2 et:
