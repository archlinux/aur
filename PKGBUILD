# Maintainer: saren@wtako.net
pkgname=pulseaudio-bt-auto-enable-a2dp
pkgver=15
pkgrel=1
pkgdesc="Udev service for temporary solve bug 92102 https://bugs.freedesktop.org/show_bug.cgi?id=92102"
url="https://gist.github.com/EHfive/c4f1218a75f95b076f0387403246de78"
arch=(any)
license=('unknown')
depends=('bluez-tools' 'expect' 'perl')
source=('20-bt-auto-enable-a2dp.rules' 'bt-auto-enable-a2dp')
sha256sums=('4b91c08e4aed1eba608ebdcf5d96aa5f93f79a054bfd925f34a583e59a261d8b' 'e36a9247bc3dd72899cc5a6ed12bbc4721f0472449acf27168a44c2af3e31544')
 
package() {
	install -Dm0755 "$srcdir/bt-auto-enable-a2dp" "$pkgdir/usr/bin/bt-auto-enable-a2dp"
	install -Dm0644 "$srcdir/20-bt-auto-enable-a2dp.rules" "$pkgdir/etc/udev/rules.d/20-bt-auto-enable-a2dp.rules"
}

