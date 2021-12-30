# Maintainer: Neeraj <neeraj.a4353@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-reactive
pkgver=0.4.8
pkgrel=1
pkgdesc="Reactive, A Simple and fast lightdm webkit2 theme for linux"
arch=('x86_64')
url="https://github.com/gitneeraj/$pkgname"
license=('MIT')
depends=('lightdm-webkit2-greeter')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d9653cf1c9281be0595ed200e9eadb7483073f04e3af2c9069a68464f4e9c90d5eb96eb7dd42130ca47645906c1eec423e32da3d7370762dd0392546ba28e4bc')

package() {
	cd "$pkgdir"
	rm -rf usr/share/lightdm-webkit/themes/reactive
	mkdir -p usr/share/lightdm-webkit/themes/
	cd usr/share/lightdm-webkit/themes/
	cp -r "$srcdir" "reactive"
}
