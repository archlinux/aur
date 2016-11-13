# Contributor:  tocer deng <tocer.deng@gmail.com>

pkgname=dhtfs
pkgver=0.3.0
pkgrel=3
pkgdesc="Tagging based filesystem, providing dynamic directory hierarchies based on tags associated with files"
arch=(any)
#url="http://code.google.com/p/dhtfs/"
#Repo of author
url=https://github.com/mayuresh/dhtfs
license=(BSD3)
depends=('python2' 'python2-fuse')
#source=("http://dhtfs.googlecode.com/files/$pkgname-$pkgver.tar.gz")
source=("git://github.com/mayuresh/dhtfs#commit=f28fb55")
md5sums=('SKIP')


package() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname"

  python2 setup.py install --prefix=/usr/ --root=$pkgdir
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:

