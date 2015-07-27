# Maintainer: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=jin
pkgver=2.14.1
pkgrel=5
pkgdesc='Java client for various chess servers'
arch=('any')
url='https://sourceforge.net/projects/jin/'
license=('GPL')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver-unix.tar.gz"
        'jin'
        'jin.desktop')
md5sums=('62256214583c3214ffb9046176b6b02d'
         'abedbd4ca7e1a97472ac973a3f534220'
         '82fb5d61fef8d202390e3fc94d3faa39')

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir/usr/share/jin/"
  cp -a * "$pkgdir/usr/share/jin/"

  install -D "$srcdir/jin.desktop" "$pkgdir/usr/share/applications/jin.desktop"
  install -D "$srcdir/jin" "$pkgdir/usr/bin/jin"
}
