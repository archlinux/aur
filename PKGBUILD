# Maintainer: tuxifreund <kaiser.barbarossa@yandex.com>
pkgname=mybrowse
pkgver=0.4
pkgrel=1
pkgdesc="A simple WebKit browser written in Python3 and using GTK3"
arch=('any')
url="https://github.com/KaiserBarbarossa/MyBrowse"
license=('GPL3')
depends=('webkit2gtk' 'python' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KaiserBarbarossa/mybrowse/archive/v$pkgver.tar.gz")
sha256sums=('20195b0e61c484c68cc124c66b352305d60a9d779a772dcba95adc9ad43bbe02')


package() {
	cd "MyBrowse-$pkgver"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	install -Dm755 mybrowse $pkgdir/usr/bin
	install -Dm644 mybrowse.desktop $pkgdir/usr/share/applications
}
