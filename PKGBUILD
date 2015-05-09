# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: floyd2 <florian@kellmer.net>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=('pure-python-otr' 'pure-python2-otr')
pkgbase=pure-python-otr
pkgver=1.0.1
pkgrel=5
pkgdesc="A pure python implementation of the OTR encryption protocol."
arch=('any')
url=https://github.com/afflux/pure-python-otr
license=('LGPL3')
makedepends=('python' 'python2' 'python-crypto>=2.1' 'python2-crypto>=2.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-otr/pure-python-otr/archive/$pkgver.tar.gz")
sha256sums=('909638104c65bfaf185e08cbfa7a328471e3d763da1a079569ab9dbfebee9f77')

package_pure-python-otr() {
  depends=('python' 'python-crypto>=2.1')

  cd "$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_pure-python2-otr() {
  depends=('python2' 'python2-crypto>=2.1')

  cd "$pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
