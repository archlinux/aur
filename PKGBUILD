# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
pkgname=hyprshot
pkgver=1.2.1
pkgrel=1
url="https://github.com/Gustash/hyprshot"
pkgdesc="A utility to easily take screenshots in Hyprland using your mouse"
arch=('any')
license=('GPL')
depends=('jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify' 'imagemagick')
provides=("$pkgname")
conflicts=("$pkgname")
source=("hyprshot-$pkgver.tar.gz::https://github.com/Gustash/hyprshot/archive/$pkgver.tar.gz")
sha512sums=('90513404c07885b75838fce814855e12bc48af214fbab7a5792b6a8f84f4d433e45811f3dedbc1651005c1797d549bf48f85b8a1c7b01982ea839c8b62f05d26')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp hyprshot "$pkgdir/usr/bin/"
}
