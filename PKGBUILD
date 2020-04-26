# Maintainer: Kat Witten <turtlewit@live.com>
pkgname=sway-launcher-desktop
pkgver=1.2.1
pkgrel=2
pkgdesc="TUI Application launcher with Desktop Entry support."
arch=('any')
url="https://github.com/Biont/sway-launcher-desktop"
license=('GPL')
depends=(fzf)
optdepends=('ttf-nerd-fonts-symbols: for launcher icon symbols')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Biont/sway-launcher-desktop/archive/v.$pkgver.tar.gz")
md5sums=('32c44646e6acf0ab8c7769d48bb5f74e')

package() {
	# sway-launcher-desktop.sh installed as /usr/bin/sway-launcher-desktop
	cd "$pkgname-v.$pkgver"
	install -d "$pkgdir/usr/bin/"
	install -m 755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
