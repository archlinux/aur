# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-dpkt
pkgver=1.8
pkgrel=0
pkgdesc="This is a Python library for interacting with and creating packets."
arch=('i686' 'x86_64')
url=("http://code.google.com/p/dpkt/")
license=('custom')
depends=('python2')
source=("http://dpkt.googlecode.com/files/dpkt-${pkgver}.tar.gz")
md5sums=('0f8e5a4d4b2f5d5faaf7bbfbf3e1e8b7')

build() {
  cd "$srcdir/dpkt-${pkgver}"
  python2 setup.py build install --root="${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:
