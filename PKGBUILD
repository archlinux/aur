# Maintainer: Simon Vall <wahll@protonmail.ch>
pkgname=elementary-wallpapers-gnome-integration
pkgver=0.0.1
pkgrel=1
pkgdesc="Make elementery-wallpapers show up in GNOME Settings"
arch=('any')
url="https://github.com/simonwahll/elementary-wallpapers-gnome-integration"
license=('GPL3')
depends=('elementary-wallpapers')
source=("https://github.com/simonwahll/elementary-wallpapers-gnome-integration/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('06a8b3e4ec6dfe32d5960736dadcecfd807bfcc8e901c98c90f4fb710af751cb')

package() {
	cd "$pkgname-$pkgver"
  install -Dm644 usr/share/gnome-background-properties/elementary-backgrounds.xml -t "$pkgdir/usr/share/gnome-background-properties/"
}
