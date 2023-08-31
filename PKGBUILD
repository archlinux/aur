# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=winkeydaemon
pkgver=1.0.PE7T
_pkgver=1.0.PE7T-2
pkgrel=5
pkgdesc="API for sending CW (Morse Code) with K1EL's USB devices"
arch=('any')
url="http://home.kpn.nl/w.knol18/qle/winkeyer/index.html"
license=('GPL')
depends=('perl-device-serialport')
source=(https://github.com/N0NB/winkeydaemon/archive/refs/tags/v$pkgver-2.tar.gz
	$pkgname.8)

package() {
	cd "$srcdir/"
	install -d $pkgdir/usr/bin
	install -D -m 755 $pkgname-$pkgver-2/$pkgname.pl $pkgdir/usr/bin/$pkgname-$pkgver-2

	mkdir -p $pkgdir/usr/share/man/man8
	install -D -m 644 $pkgname.8 $pkgdir/usr/share/man/man8/.
}
md5sums=('7df4f47581739f94464738ea027e1fed'
         '5d9ec64280698a6e9878a4d3e1a869b1')
sha256sums=('9a3603499b4a35940f647229cf3f3c4583237ce646211b79b439b6aec2ef5b85'
            '9e2e19b5cc66edf29104853b0b7502dbeae5cc9a20a584c46933b0d38f682176')
