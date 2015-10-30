# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=updpkg
pkgver=20151030
pkgrel=1
pkgdesc="checks PKGBUILD, updates checksums and pkgver and creates .SRCINFO"
arch=('i686' 'x86_64')
url="https://forum.manjaro.org/index.php?topic=26744.0"
license=('GPL')
depends=('pkgbuild-introspection')
source=$pkgname
md5sums=('2288e5e41692512380e546a3a11cbab6')

pkgver() {
	date +'%Y%m%d'
}

package() {
  cd $srcdir
  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
