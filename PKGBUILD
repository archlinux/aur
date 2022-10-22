# Maintainer: Ybalrid <ybalrid@ybalrid.org>
# Contributor: X0rg

pkgname=systemd-numlockontty
pkgver=0.1
pkgrel=13
pkgdesc="Systemd service + script, automatically activate numpad on ttys"
arch=('any')
url="https://github.com/Ybalrid/systemd-numlockontty"
depends=('systemd')
replaces=('numlockontty')
license=('GPL')
install=numlockontty.install
source=("https://github.com/Ybalrid/systemd-numlockontty/releases/download/$pkgver-$pkgrel/numlockontty-$pkgver.tar.gz")
md5sums=('7e5ce843e9951c3c596457e63053384d')

package() {
	install -Dvm755 "$srcdir/numlockOnTty"		 "$pkgdir/usr/bin/numlockOnTty"
	install -Dvm644 "$srcdir/numlockOnTty.service"	 "$pkgdir/usr/lib/systemd/system/numLockOnTty.service"
}
