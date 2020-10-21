pkgname=tumbler-folder-thumbnailer
pkgver=1
pkgrel=1
pkgdesc="Custom folder thumbnails for Tumbler"
arch=('any')
url="https://docs.xfce.org/xfce/tumbler/available_plugins"
license=('BSD')
depends=('tumbler' 'imagemagick')
optdepends=('inkscape: for SVG support')
source=('folder.thumbnailer'
		'folder-thumbnailer')
sha512sums=('e62c5407390861affdcaf5029f2d7c28d1e623d6361d37a28af0e36cd2dec5c3226d747c608b8b88c5e4deb00197d0d35656963ade5e3a160b0cc29bfcf31bac'
			'e6b5ab3e805dbb187ca1dce12ef18c11595628ecdde68c2b1ded8c19a7c03a828e96b7cebc0af5bddfbdd0587fbad5e91974c2575a7ca764e38ef9b1c717d1e5')

package() {
	install -Dvm644 "folder.thumbnailer" "$pkgdir/usr/share/thumbnailers/folder.thumbnailer"
	install -Dvm755 "folder-thumbnailer" "$pkgdir/usr/bin/folder-thumbnailer"
}
