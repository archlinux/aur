# Maintainer: Neeraj <neeraj.a4353@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-reactive
pkgver=0.3.0
pkgrel=5
pkgdesc="Reactive, A Simple and fast lightdm webkit2 theme for linux"
arch=('x86_64')
url="https://github.com/gitneeraj/$pkgname"
license=('MIT')
depends=('lightdm-webkit2-greeter')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fb7df70c9fcb231b527804248bab1df5ea5b3f9b44b5d4c3ce4c46b2e263b3050222eb31aab58f81c50a2fd2e3f4e9c5b768331ebbd3bfb303cadd013f5d61f4')

package() {
	rm "$srcdir/$pkgname-${pkgver}.tar.gz"
	rm -rf "$pkgdir/usr/share/lightdm-webkit/themes/reactive"
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/reactive"
	cp -r "$srcdir"/* "$pkgdir/usr/share/lightdm-webkit/themes/reactive/"
}
