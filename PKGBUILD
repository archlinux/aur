# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=setl
pkgver=0.1.2
pkgrel=1
pkgdesc="High level dynamic set based language."
arch=('i686' 'x86_64')
url="http://setl.org/setl/"
license=('GPL')
depends=('glibc')

case $CARCH in
  'i686')
    source=("http://setl.org/setl/bin/Linux-x86-32bit/setlbin.tgz")
    md5sums=('584da279b18496655057fe72a085982a')
    ;;
  'x86_64')
    source=("http://setl.org/setl/bin/Linux-x86-64bit/setlbin.tgz")
    md5sums=('74ed85446def1975dcb36a7d3cbcf00b')
    ;;
esac

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 setl{,cpp,tran} "$pkgdir/usr/bin/"
}


