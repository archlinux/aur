pkgname=get_flash_videos
pkgver=1.24
pkgrel=1
pkgdesc="Download flash videos from a web page"
arch=('i686' 'x86_64')
url="http://code.google.com/p/get-flash-videos/"
license=('Apache')
depends=('perl-www-mechanize' 'perl-xml-simple')
source=(http://get-flash-videos.googlecode.com/files/$pkgname-$pkgver)
noextract=($pkgname-$pkgver)

build() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $pkgname-$pkgver $pkgdir/usr/bin/$pkgname
}
md5sums=('0a02aa05e978fe111f1811eef627d440')
