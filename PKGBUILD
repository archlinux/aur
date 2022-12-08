# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=bemenu-dmenu-wayland
pkgver=1
pkgrel=1
pkgdesc="Symlink for using bemenu as a drop-in replacement to dmenu-wayland"
arch=('any')
url="https://github.com/Cloudef/bemenu"
license=('LGPL3')
depends=('bemenu')
provides=('dmenu-wayland')
conflicts=('dmenu-wayland')

package() {
	install -d "$pkgdir"/usr/bin
	ln -s /usr/bin/bemenu "$pkgdir"/usr/bin/dmenu-wl
	ln -s /usr/bin/bemenu-run "$pkgdir"/usr/bin/dmenu-wl_run
}

