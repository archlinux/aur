pkgname=djgpp-configure
pkgver=20160430
pkgrel=1
pkgdesc="Configure script wrapper for DJGPP"
arch=(any)
url="about:blank"
license=("GPL")
depends=(djgpp-pkg-config)
source=("$pkgname.sh")
md5sums=('3bc2f47fd5c0a44ea6e330f98618403f')

package() {
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/i686-pc-msdosdjgpp-configure"
}
