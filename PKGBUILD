# Maintainer: MTroy <mtroy[at]helios[dot]so>
# Contributor: 

pkgname=fnotify
pkgver=0.0.4
pkgrel=2
pkgdesc="irssi plugin to notify discussions over desktop"
url="http://www.mtroy.net"
arch=('any')
license=('GPL2')
install=.install
depends=('perl' 'irssi', 'xfce4-notifyd')
source=(${pkgname}-${pkgver}.tar.gz::http://pkg.helios.so:44000/src/${pkgname}-${pkgver}.tar.gz)
sha512sums=('cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e')
validpgpkeys=('CE8D66E2FBEE8306')

#build() {

#}

package() {

#	cd "$srcdir/$pkgname-$pkgver"
#	cd "$pkgname-$pkgver"
#	cd ${srcdir}

	mkdir -p "$pkgdir/usr/share/irssi/scripts"
	install -D -m755 $srcdir/usr/share/irssi/scripts/$pkgname.pl $pkgdir/usr/share/irssi/scripts/
}


