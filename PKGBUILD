# Maintainer: alexiobash <me @ alexiobash.com>

pkgname=conky-top
pkgver=1.5
pkgrel=2
pkgdesc="A Top conky-lua for ArchLinux"
arch=('any')
url="http://alexiobash.com/conky-top-monitor-di-sistema-a-pannello/"
license=('GPL')
depends=('conky-lua')
source=("http://mirror.alexiobash.com/alexiobash/project/conky-top/$pkgname-$pkgver.tar.gz")
md5sums=('612c6548655ebdfe170c8b28da05973c')

package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}


