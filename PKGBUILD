# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=winkeydaemon-n0nb
_pkgname=winkeydaemon
pkgver=1.0.10
pkgrel=1
pkgdesc="API for sending CW (Morse Code) with K1EL's USB devices - N0NB version"
arch=('any')
url="https://github.com/N0NB/winkeydaemon"
license=('GPL')
depends=('perl-device-serialport')
provides=('winkeydaemon')
source=(https://github.com/N0NB/winkeydaemon/archive/refs/tags/v$pkgver.tar.gz)

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -d $pkgdir/usr/bin
	install -D -m 755 src/$_pkgname $pkgdir/usr/bin/$pkgname-$pkgver.pl

	mkdir -p $pkgdir/usr/share/man/man1
	install -D -m 644 man/$_pkgname.1 $pkgdir/usr/share/man/man1/.
}
md5sums=('8ae113ec7fad13f060e77eb348ad128b')
sha256sums=('48c7e29101f58d719fd89ab0cca9fdece05d4705c91b7da68a3d1e6075fab7ff')
