# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=xmobar-does-chase-have-a-job-yet
pkgver=2
pkgrel=1
pkgdesc="doeschasehaveajobyet.com as an xmobar monitor"
arch=(any)
url="https://github.com/maandree/xmobar-does-chase-have-a-job-yet"
license=('custom:GNUAllPermissive')
depends=(wget sh grep coreutils)
makedepends=(make coreutils)
source=($url/archive/$pkgver.tar.gz)
sha256sums=('b896024d5c2d5c5b882c1d03aec545d2ce49f8c107e4bca0fd93a66f91e07ef5')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

