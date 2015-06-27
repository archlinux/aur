# Maintainer: alexiobash < me (at) alexiobash (dot) com >

pkgname=conky-lua-arch
pkgver=1.2
pkgrel=2
pkgdesc="A conky-lua for ArchLinux"
arch=('any')
url="http://alexiobash.com/conky-lua-arch/"
license=('GPL')
depends=('conky-lua' 'git')
source=("$pkgname::git+http://git.alexiobash.com/git/$pkgname")
install="${pkgname}.install"
md5sums=('SKIP')
backup=('etc/conky/conky-arch.conf')

package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}
