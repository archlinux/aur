pkgname=djgpp-pkg-config
pkgver=20160430
pkgrel=1
pkgdesc="pkg-config wrapper for DJGPP"
arch=(any)
url="http://pkg-config.freedesktop.org/"
license=("zlib")
depends=(pkg-config djgpp-djcrx)
source=("djgpp-pkgconfig.sh")
md5sums=('e72377edcd717a9a101e026af237872a')

package() {
  install -Dm755 djgpp-pkgconfig.sh "$pkgdir/usr/bin/i686-pc-msdosdjgpp-pkg-config"
}
