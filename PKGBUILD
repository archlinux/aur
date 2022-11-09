# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
pkgname=hyprshot
pkgver=1.0.1
pkgrel=1
url="https://github.com/Gustash/hyprshot"
pkgdesc="A utility to easily take screenshots in Hyprland using your mouse"
arch=('any')
license=('GPL')
depends=('jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify')
optdepends=()
source=("hyprshot-$pkgver.tar.gz::https://github.com/Gustash/hyprshot/archive/$pkgver.tar.gz")
sha512sums=('315f0b41100a66ae5dc640a00a6d6e7af0c595b71f5f2562c417999015f58de03ed7b26acf9115f472a721389c627eafec6a83221ce54847f5d6603dae4c98ce')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp hyprshot "$pkgdir/usr/bin/"
}
