# Maintainer: ResinDrake <resin@resindrake.net>
pkgname=kde5-wallpaper-daynight-git
_pkgname=kde5-wallpaper-daynight
pkgver=v19_10_02_b
pkgrel=1
pkgdesc="A script that allows users to change their wallpaper in KDE Plasma based on the time of day."
url="https://github.com/ResinDrake/kde5-wallpaper-daynight"
license=('MIT')
depends=('bash')
makedepends=('git')
arch=('any')
source=("git://github.com/ResinDrake/$_pkgname.git")
md5sums=('SKIP')



pkgver() {
 	cd "${srcdir}/${_pkgname}"
 	printf git describe
}

package() {
	cd "${srcdir}/${_pkgname}"
	./INSTALL.sh "$pkgdir"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
