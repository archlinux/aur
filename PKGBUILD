# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: John Lane <archlinux at jelmail dot com>
pkgname='railway-sans-font'
pkgver='20170421'
pkgrel='6'
pkgdesc="An open source version of Edward Johnston's Timeless Typeface for London Underground of 1916"
arch=('any')
url='https://fontlibrary.org/en/font/railway-sans'
license=('custom:SIL Open Font License v1.1')
source=("$pkgname-$pkgver-$pkgrel.zip::https://fontlibrary.org/assets/downloads/railway-sans/9f707f44ac7fca4fb8371e69b19df471/railway-sans.zip"
		'LICENSE')
sha256sums=('b47c3a14813fed0898b9d7ec9300b58ee0f91155fcdaa1dca4e78647d4ee92a0'
            'ba10995e8c546e47f34cdefaac8f8de96a967a132e65c5f7efa02e61cff11ed2')

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/share/fonts/"{O,T}'TF'
	install -Dm644 'OTF/'*'.otf' "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 'TTF/'*'.ttf' "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
