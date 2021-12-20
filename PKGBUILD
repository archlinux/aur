# Maintainer: j-james <jj@j-james.me>
pkgname=tumbler-folder-thumbnailer
pkgver=1
pkgrel=2
pkgdesc="Custom folder thumbnails for Tumbler"
arch=('any')
url="https://docs.xfce.org/xfce/tumbler/available_plugins"
license=('BSD')
depends=('tumbler' 'imagemagick')
optdepends=('inkscape: for SVG support')
source=('folder.thumbnailer'
		'folder-thumbnailer.sh')
sha256sums=('4079476266971a1d6e48360fa3e1ee038ed9e91eb85bc089569ea0dbde3d24d4'
			'bb9fcf291fe811b9e97f73ba2f6fda4ff9f6216a40a150ddcd725d2c563deac8')

package() {
	install -Dvm644 "folder.thumbnailer" "$pkgdir/usr/share/thumbnailers/folder.thumbnailer"
	install -Dvm755 "folder-thumbnailer.sh" "$pkgdir/usr/bin/folder-thumbnailer"
}
