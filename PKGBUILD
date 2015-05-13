# Contributor:  tocer deng <tocer.deng@gmail.com>

pkgname=dhtfs
pkgver=0.3.0
pkgrel=3
pkgdesc="Tagging based filesystem, providing dynamic directory hierarchies based on tags associated with files"
arch=(any)
url="http://code.google.com/p/dhtfs/"
license=(custom)
depends=('python2' 'python2-fuse')
source=("http://dhtfs.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('9e2c16ef88f925453aac5935354f5a35')


package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --prefix=/usr/ --root=$pkgdir
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

