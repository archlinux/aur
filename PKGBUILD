# Maintainer: alexiobash < me (at) alexiobash (dot) com >

pkgname=conky-lua-arch
pkgver=1.0
pkgrel=2
pkgdesc="A conky-lua for ArchLinux"
arch=('any')
url="http://alexiobash.com/en/conky-lua-arch/"
license=('GPL')
depends=('conky-lua')
source=("http://mirror.alexiobash.com/alexiobash/project/conky-lua-arch/$pkgname-$pkgver.tar.gz")

md5sums=('2fa6ab6e26331833691c65581c46caec')

package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}
