# Maintainer: Neeraj <neeraj.a4353@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-reactive
pkgver=0.4.6
pkgrel=1
pkgdesc="Reactive, A Simple and fast lightdm webkit2 theme for linux"
arch=('x86_64')
url="https://github.com/gitneeraj/$pkgname"
license=('MIT')
depends=('lightdm-webkit2-greeter')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0e38f0a45cc4002d425cdb88ec49a7f068ddbe2c32849851d60344a9b631d93d1b5ca55d3413f64eb0b87aef15706eba4b8fb682e77828c22652b6dc4ceb6dee')

package() {
	cd "$pkgdir"
	rm -rf usr/share/lightdm-webkit/themes/reactive
	mkdir -p usr/share/lightdm-webkit/themes/
	cd usr/share/lightdm-webkit/themes/
	cp -r "$srcdir" "reactive"
}
