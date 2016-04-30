pkgname=djgpp-configure
pkgver=20160430
pkgrel=2
pkgdesc="Configure script wrapper for DJGPP"
arch=(any)
url="about:blank"
license=("GPL")
depends=(djgpp-pkg-config)
source=("$pkgname.sh")
md5sums=('2259094ddf6aa9da0b6da76d4eac5495')

package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/i686-pc-msdosdjgpp-configure"
}
