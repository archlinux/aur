# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=grimshot-bin-sway
pkgver=1
pkgrel=3
epoch=
pkgdesc="Symlink sway-contrib's included grimshot script to /usr/bin"
arch=(any)
url='https://swaywm.org/'
license=(MIT)
provides=(grimshot)
conflicts=(grimshot)

package() {
	depends+=(sway-contrib grim slurp jq)
	optdepends+=(
		'wl-clipboard: Copying screenshot to clipboard'
		'libnotify: Notification support'
	)
	install -dm755 "$pkgdir/usr/bin"
	ln -s '/usr/share/sway-contrib/grimshot' "$pkgdir/usr/bin/grimshot"
}
