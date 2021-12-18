# Maintainer: Neeraj <neeraj.a4353@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-reactive
pkgver=0.4.5
pkgrel=2
pkgdesc="Reactive, A Simple and fast lightdm webkit2 theme for linux"
arch=('x86_64')
url="https://github.com/gitneeraj/$pkgname"
license=('MIT')
depends=('lightdm-webkit2-greeter')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('aff84430926162d1ba019b37a37ce16f1c93fbec6b7e851bb48f9deb2a016096d33f4bee553a5216858c4c024cb9b85929a4dcba3ae430655d1cf66a522b7548')

package() {
	cd "$pkgdir"
	rm -rf usr/share/lightdm-webkit/themes/reactive
	mkdir -p usr/share/lightdm-webkit/themes/
	cd usr/share/lightdm-webkit/themes/
	cp -r "$srcdir" "reactive"
}
