# Maintainer: Neeraj <neeraj.a4353@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-reactive
pkgver=0.2.0
pkgrel=2
pkgdesc="Reactive, A Simple and fast lightdm webkit2 theme for linux"
arch=('any')
url="https://github.com/gitneeraj/$pkgname"
license=('MIT')
depends=('lightdm-webkit2-greeter')
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('e1c90c51167304716d1656b12b9890ea28aa2800d120fc564a5178ee9a9aff8498a1ffaf50793938fdba8f1e53beb03a8b3ad681ed05844096a2f99b4f40f948')

package() {
	install -dm 755 "$pkgdir"/usr/share/lightdm-webkit/themes/reactive
	cp -r --no-preserve=ownership * "$pkgdir"/usr/share/lightdm-webkit/themes/reactive/
}
