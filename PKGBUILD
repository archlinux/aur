pkgname=thunar-hardlinkcopy
pkgdesc="Add a custom action to Thunar to perform hard link copies. Replace 'owner' in PKGBUILD with your username."
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
source=("uca.xml")
md5sums=('SKIP')
depends=('zenity')

package() {
	mkdir -p $pkgdir/home/owner/.config/Thunar/
	cp uca.xml $pkgdir/home/owner/.config/Thunar/
}
