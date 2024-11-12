# Maintainer: Phillip Raffeck <phillip at rffck dot com>
pkgname=otf-modernline
pkgver=1.0
pkgrel=1
pkgdesc="Modernline font from https://www.dafont.com/modernline.font"
arch=('any')
url="https://www.dafont.com/modernline.font"
license=("LicenseRef-personal-use")
source=("$pkgname.zip::https://dl.dafont.com/dl/?f=modernline")
sha256sums=('9c578e8863ad28a7a3c2a9720b35c0007c096ee45fc324ac37f7d457c5677ff1')

package() {
	install -dm755 "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" "$srcdir/modernline.otf"

	install -dm755 "$pkgdir/usr/share/licenses/"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/License Request.txt"
}
