# Maintainier: FadeMind <fademind@gmail.com>

pkgname=kdeartwork-wallpapers-archlinux-caledonia
_basename=archlinux-caledonia
pkgver=1.0
pkgrel=1
pkgdesc="Arch Linux Caledonia Wallpaper"
arch=('any')
license=('CCPL')
url="http://malisremac.deviantart.com/art/Arch-Linux-Caledonia-311824516"
depends=('kdebase-workspace')
optdepends=('caledonia-bundle: A bundle with all Caledonia customizations')	
source=($_basename.zip::'https://copy.com/FD9JKQwErBknZQkY%2FArch+Linux+Caledonia.zip?download=1')
sha256sums=('ff749678ee022a8bcdb9f2ad10153f492d23e9eb06137f037120ede5d2ceb0a3')

package() {
  	cd "$srcdir"
	find Arch\ Linux\ Caledonia/* -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/wallpapers/{}" \;
} 
