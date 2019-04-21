# Contributor: Maxim Devaev <mdevaev@gmail.com>

pkgname=yay-kit
pkgver=20190421
pkgrel=1
pkgdesc="Bash wrapper for pacman and YAY"
url="http://github.com/pi-kvm/yay-kit"
license=(GPL3)
arch=(any)
depends=(yay sudo)
install=$pkgname.install
source=(pkg-install sudoers)
md5sums=(SKIP SKIP)


package() {
	cd $srcdir
	install -D -m755 pkg-install "$pkgdir/usr/bin/pkg-install"
	install -D -m660 sudoers "$pkgdir/etc/sudoers.d/99-yay"
}
