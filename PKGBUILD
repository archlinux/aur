# Maintainer: Neeraj <neeraj.a4353@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-reactive
pkgver=0.4.4
pkgrel=2
pkgdesc="Reactive, A Simple and fast lightdm webkit2 theme for linux"
arch=('x86_64')
url="https://github.com/gitneeraj/$pkgname"
license=('MIT')
depends=('lightdm-webkit2-greeter')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8c9f6099db430e3fe4869dcb5cddac93d438e4d79b8b2dccabba8839981d9e5e5e3687b939561ef2474742f3333aaaf11b53adc50fe2e70276a7a560d387765a')

package() {
	cd "$pkgdir"
	rm -rf usr/share/lightdm-webkit/themes/reactive
	mkdir -p usr/share/lightdm-webkit/themes/
	cd usr/share/lightdm-webkit/themes/
	cp -r "$srcdir" "reactive"
}
