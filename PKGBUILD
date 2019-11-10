# Maintainer: Kat Witten <turtlewit@live.com>
pkgname=sway-launcher-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="A launcher menu made for the Sway window manager made with bash and the amazing fzf."
arch=(x86_64)
url="https://github.com/Biont/sway-launcher-desktop"
license=('GPL')
depends=(sway fzf)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Biont/sway-launcher-desktop/archive/v$pkgver.tar.gz")
md5sums=('a0bce97a26b7086bac33bc8701f723e2')

package() {
	# sway-launcher-desktop.sh installed as /usr/bin/sway-launcher-desktop
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/usr/bin/"
	install -m 755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
