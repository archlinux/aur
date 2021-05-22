# Maintainer: Neeraj <neeraj.a4353@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-reactive
pkgver=0.4.0
pkgrel=9
pkgdesc="Reactive, A Simple and fast lightdm webkit2 theme for linux"
arch=('x86_64')
url="https://github.com/gitneeraj/$pkgname"
license=('MIT')
depends=('lightdm-webkit2-greeter')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9683e6b2ebd98b020042d336e85728df057c5a0c4077943bf997e966dccd16447ea6b878ae1419ab2946a4c47114a6b4b7b6a5c22ad422a59269a93c2236bfd8')

package() {
	cd "$pkgdir"
	rm -rf usr/share/lightdm-webkit/themes/reactive
	mkdir -p usr/share/lightdm-webkit/themes/
	cd usr/share/lightdm-webkit/themes/
	cp -r "$srcdir" "reactive"
}