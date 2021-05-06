# Maintainer: Simon Vall <wahll@protonmail.ch>
pkgname=nature-wallpapers-gnome-integration
pkgver=0.0.1
pkgrel=1
pkgdesc="Make nature-wallpapers show up in GNOME Settings"
arch=('any')
url="https://github.com/simonwahll/nature-wallpapers-gnome-integration"
license=('GPL3')
depends=('nature-wallpapers')
source=("https://github.com/simonwahll/nature-wallpapers-gnome-integration/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('feb9c4f13fa58fdfc6e8e8524d24a3d027ecd801d6cc3bc92e3ac77736d22652')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 usr/share/gnome-background-properties/nature-wallpapers-backgrounds.xml -t "$pkgdir/usr/share/gnome-background-properties/"
}
