# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
pkgname=hyprshot
pkgver=1.1.0
pkgrel=1
url="https://github.com/Gustash/hyprshot"
pkgdesc="A utility to easily take screenshots in Hyprland using your mouse"
arch=('any')
license=('GPL')
depends=('jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify')
provides=("$pkgname")
conflicts=("$pkgname")
source=("hyprshot-$pkgver.tar.gz::https://github.com/Gustash/hyprshot/archive/$pkgver.tar.gz")
sha512sums=('f8da4ac1e9a5fc2e458698782e64778cd6b06ff930313b12895bdce66f481d3ac92bac481079817cea8582baab9ff59f65a2a13e4b586bf3187a1c0bc40937af')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp hyprshot "$pkgdir/usr/bin/"
}
