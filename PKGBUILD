pkgname=djgpp-configure
pkgver=20160430
pkgrel=1
pkgdesc="Configure script wrapper for DJGPP"
arch=(any)
url="about:blank"
license=("GPL")
depends=(djgpp-pkg-config)
source=("$pkgname.sh")
md5sums=('e72377edcd717a9a101e026af237872a')

package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/i686-pc-msdosdjgpp-configure"
}
