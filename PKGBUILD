# Contributor: Tocer Deng <tocer.deng@gmail.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=google-docs-fs
pkgver=1.0rc1
pkgrel=2
pkgdesc="allow you to connect to Google Docs and treat it as a file system"
arch=('i686' 'x86_64')
url="http://code.google.com/p/google-docs-fs/"
license=('GPL2')
depends=('python' 'python2-fuse' 'python2-gdata')
source=("http://google-docs-fs.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('042b7c6e4f55cedfb2c8e64e4244675f')

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --root=$pkgdir --optimize=1 || return 1
  #DESTDIR="$pkgdir/usr/share/$pkgname"
  #install -d $DESTDIR
  #install -m 0644 gNet.py $DESTDIR
  #install -m 0755 gFile.py $DESTDIR

  #BINDIR="$pkgdir/usr/bin"
  #install -d $BINDIR
  #install -m 0755 gmount $BINDIR
  #install -m 0755 gumount $BINDIR
  #sed -i "/else/a\    cd /usr/share/$pkgname" $BINDIR/gmount
}

# vim:set ts=2 sw=2 et:
