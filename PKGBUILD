# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
pkgname=lightdm-gdmflexiserver
pkgver=1
pkgrel=1
pkgdesc="Dummy script for applications expecting gdm instead of lightdm"
arch=('any')
license=('GPL')
depends=('lightdm')
conflicts=('gdm')
source=("gdmflexiserver-fake.sh")
md5sums=('SKIP')

package() {
	install -dm0755 "$pkgdir/usr/bin"
	install -m0755 "$srcdir/gdmflexiserver-fake.sh" \
		"$pkgdir/usr/bin/gdmflexiserver"
}
