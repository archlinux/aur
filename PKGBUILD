# Maintainer: Neeraj <neeraj.a4353@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-reactive
pkgver=0.1.4
pkgrel=1
pkgdesc="Reactive, A Simple and fast lightdm webkit2 theme for linux"
arch=('any')
url="https://github.com/gitneeraj/$pkgname"
license=('GPL3')
depends=('lightdm-webkit2-greeter')
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('d72ccad2e403e1db2bde7b0939790e5806f1dbef5255cd9868cfa470619f4d366e2dac69fce2f07972adfc1e6d97d6da9d0383a9601b08ac1d65b0bf3c1da857')

package() {
	install -dm 755 "$pkgdir"/usr/share/lightdm-webkit/themes/reactive
	cp -r --no-preserve=ownership * "$pkgdir"/usr/share/lightdm-webkit/themes/reactive/
}
