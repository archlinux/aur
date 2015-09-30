# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=updpkg
pkgver=20150930
pkgrel=1
pkgdesc="checks PKGBUILD and updates checksums and pkgver automatically"
arch=('i686' 'x86_64')
url=" "
license=('GPL')
depends=('pkgbuild-introspection')
source=$pkgname
md5sums=('461fcc327fec0bd662cacc0d94bfc6ee')

pkgver() {
	date +'%Y%m%d'
}

package() {
  cd $srcdir
  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
