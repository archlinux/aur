# Maintainer: Simon Vall <wahll@protonmail.ch>
pkgname=deepin-wallpapers-gnome-integration
pkgver=0.0.1
pkgrel=1
pkgdesc="Make deepin-wallpapers show up in GNOME Settings"
arch=('any')
url="https://github.com/simonwahll/deepin-wallpapers-gnome-integration"
license=('GPL3')
depends=('deepin-wallpapers')
source=("https://github.com/simonwahll/deepin-wallpapers-gnome-integration/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('40527b09297aa590f69baa47e5b4f51a2b9bb6dc28daef00e457de20a90bd67e')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 usr/share/gnome-background-properties/deepin-backgrounds.xml -t "$pkgdir/usr/share/gnome-background-properties/"
}
