# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=session-desktop-files
pkgver=0.6
pkgrel=2
pkgdesc=".desktop launch files for common session operations (log out, shutdown, reboot)"
arch=('any')
url="https://wiki.archlinux.org/index.php/Desktop_Entries"
license=('MIT')
depends=('wmctrl')
makedepends=('desktop-file-utils')
source=('shutdown.desktop' 'reboot.desktop' 'logout.desktop')
md5sums=('0b96617dd2ba9ceab94c3252c69c9941'
         '0a16e48fd4b2e01407b31cfe5deb425c'
         'cf8084d9540155104aeca020f47947c7')

prepare() {
	:
}

build() {
	:
}

check() {
	cd "$srcdir"
	desktop-file-validate shutdown.desktop reboot.desktop logout.desktop
}

package() {
	cd "$srcdir"
	install -D shutdown.desktop "$pkgdir"/usr/share/applications/shutdown.desktop
	install -D reboot.desktop "$pkgdir"/usr/share/applications/reboot.desktop
	install -D logout.desktop "$pkgdir"/usr/share/applications/logout.desktop
}
