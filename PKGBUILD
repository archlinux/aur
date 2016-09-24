# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: floyd2 <florian@kellmer.net>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python2-pure-python-otr
pkgver=1.0.1
pkgrel=7
pkgdesc='Off-The-Record Protocol Implementation in Python'
arch=('any')
url=https://github.com/afflux/pure-python-otr
license=('LGPL3')
makedepends=('python2' 'python2-crypto>=2.1')
conflicts=('pure-python2-otr')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-otr/pure-python-otr/archive/$pkgver.tar.gz")
sha256sums=('909638104c65bfaf185e08cbfa7a328471e3d763da1a079569ab9dbfebee9f77')

package() {
  cd pure-python-otr-"$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
