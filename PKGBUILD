# Maintainer: j-james <jj@j-james.me>
pkgname=tumbler-stl-thumbnailer
pkgver=1
pkgrel=1
pkgdesc="Custom STL thumbnails for Tumbler"
arch=('any')
url="https://github.com/j-james/thunar-stl-thumbnails"
license=('BSD')
depends=('tumbler' 'openscad')
source=('stl.thumbnailer'
		'stl-thumbnailer.sh')
sha256sums=('fd4a8c44e4a35418e894241a3e6fefcab83279570b5e91296dde1f1179b0a0cc'
			'0b6a39b7facae2c7d036a0017010a86f6a3ebcb2a572312174d7d4cff1af8325')

package() {
	install -Dvm644 "stl.thumbnailer" "$pkgdir/usr/share/thumbnailers/stl.thumbnailer"
	install -Dvm755 "stl-thumbnailer.sh" "$pkgdir/usr/bin/stl-thumbnailer"
}
