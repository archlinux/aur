# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=fortune-mod-profile
pkgver=1
pkgrel=1
pkgdesc="Displays a random fortune on interactive shells"
arch=(x86_64 i686)
license=('GPL')
depends=(fortune-mod)
source=(fortune.sh)
md5sums=('67de8fac2af4c5c3050670a3219cb990')

package() {
  install -Dm 755 $srcdir/fortune.sh $pkgdir/etc/profile.d/fortune.sh
}

# vim:set ts=2 sw=2 et:
