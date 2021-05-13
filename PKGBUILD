# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=mkinitcpio-fbcon
pkgver=1.0
pkgrel=1
pkgdesc="A hook to rotate the console at startup."
arch=('any')
url="https://www.archlinux.org/"
license=('GPL')
depends=('bash')
source=(fbcon.hook fbcon.install)
md5sums=('c03097e0e22d539b58476e67a8cea1d9'
         '40d8ecd9880d72cd515c446be033f0fd')

package() {
	install -Dm644 fbcon.install "$pkgdir/usr/lib/initcpio/install/fbcon"
	install -Dm644 fbcon.hook "$pkgdir/usr/lib/initcpio/hooks/fbcon"
}
