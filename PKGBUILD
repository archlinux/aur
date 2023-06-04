# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=grimshot-sway-bin
pkgver=1
pkgrel=1
epoch=
pkgdesc="Symlink sway's included grimshot script to /usr/bin"
arch=(any)
url='https://swaywm.org/'
license=('MIT')
provides=(grimshot)
conflicts=(grimshot)

package() {
	depends+=(sway grim slurp jq)
	optdepends+=(wl-clipboard libnotify)
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/usr/share/sway/scripts/grimshot" "$pkgdir/usr/bin/grimshot"
}
