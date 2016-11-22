# Maintainer: Jason Graves <j.graves@collaboradev.com>

pkgname=xfce4-finder
pkgver=1.0.0
pkgrel=1
pkgdesc="Smart and intuitive application finder, complete with theme and customization support."
arch=('any')
url="https://github.com/godlikemouse/xfce4-finder"
license=('MIT')
groups=('xfce4')
depends=('glib2' 'gtkmm' 'garcon' 'xfconf' 'libxfce4util' 'libxfce4ui')
makedepends=('automake' 'autoconf' 'xfce4-dev-tools' 'git')
source=('https://github.com/godlikemouse/xfce4-finder.git')
md5sums=('SKIP')

pkgver() {
	git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
	install -Dm755 "$pkgdir/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname-git/LICENSE"
}
	

