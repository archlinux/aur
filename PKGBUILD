# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=playfair-display
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=1.005
pkgrel=1
pkgdesc='a transitional design from when broad nib quills were replaced by pointed steel pens'
arch=(any)
url="https://www.fontsquirrel.com/fonts/$_name"
license=(OFL)
source=("$_name-$pkgver-$pkgrel.zip::https://www.fontsquirrel.com/fonts/download/$_name")
sha256sums=('e3352c135c5c0175d4cd11a8293cede460f97196aec74369a05b188108b0d046')

package_otf-playfair-display() {
	provides=("$pkgbase")
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" *License.txt
}
