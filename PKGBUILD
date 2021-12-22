# Maintainer: Gregory Dushkin (GregTheMadMonk) <yagreg7@gmail.com>
pkgname=gnome-shell-extension-cmus-status-git
pkgver=10
pkgrel=1
pkgdesc="A GNOME shell extension for displaying controlling cmus status via cmus-remote"
arch=(any)
url="https://github.com/gregthemadmonk/gnome-cmus-status.git"
license=('GPL2')
depends=("gnome-shell>=1:40.0" cmus)
source=("git+$url")
md5sums=('SKIP')

package() {
	cd gnome-cmus-status
	DESTDIR="$pkgdir/" make install
}
