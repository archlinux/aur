# Maintainer:  Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
pkgname=gtk-theme-+1
pkgver=25032013
pkgrel=1
pkgdesc="A flat gtk theme inspired by the google interface."
arch=('any')
url="http://nale12.deviantart.com/art/1-18032013-358336961"
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engine-unico' 'gtk-engine-murrine')

# DeviantArt doesn't allow direct downloads - please download the ZIP manually.
source=('_1_25032013_by_nale12-d5xcekh.zip')
md5sums=('e43b0af9d09b6c0cf3ad07c9b676f55e')

package() {
	cd "+1"
	install -d -m 755 "$pkgdir/usr/share/themes/+1"
	find . -type f -exec install -D -m 644 '{}' "$pkgdir/usr/share/themes/+1/{}" ';'
}
