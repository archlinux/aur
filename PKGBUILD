# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=winkeydaemon
pkgver=1.0.PE7T
pkgrel=2
pkgdesc="API for sending CW (Morse Code) with K1EL's USB devices"
arch=('any')
url="http://home.kpn.nl/w.knol18/qle/winkeyer/index.html"
license=('GPL')
depends=('perl-device-serialport')
source=(http://home.kpn.nl/w.knol18/qle/winkeyer/$pkgname-$pkgver-2.gz
	$pkgname.8)

package() {
	cd "$srcdir/"
	install -d $pkgdir/usr/bin
	install -D -m 755 $pkgname-$pkgver-2 $pkgdir/usr/bin/.

	mkdir -p $pkgdir/usr/share/man/man8
	install -D -m 644 $pkgname.8 $pkgdir/usr/share/man/man8/.
}
md5sums=('f8a9e7aa551446ac26798f250919d849'
         '5d9ec64280698a6e9878a4d3e1a869b1')
sha256sums=('f93a1301443c08ab8eea58d50e021257da03066fec61f9ba4bb229f664aef084'
            '9e2e19b5cc66edf29104853b0b7502dbeae5cc9a20a584c46933b0d38f682176')
