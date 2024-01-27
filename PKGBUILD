# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: John Lane <archlinux at jelmail dot com>
_projectname='railway-sans'
pkgname="$_projectname-font"
pkgver='20170421'
pkgrel='6'
pkgdesc="An open source version of Edward Johnston's Timeless Typeface for London Underground of 1916"
arch=('any')
url="https://fontlibrary.org/en/font/$_projectname"
license=('OFL-1.1-RFN')
source=(
	"$pkgname-$pkgver.zip::https://fontlibrary.org/assets/downloads/$_projectname/9f707f44ac7fca4fb8371e69b19df471/$_projectname.zip"
	'LICENSE'
)
sha512sums=('0861032ba83dad716e0da1e3386eb4c7b54112d66aa7d08d6b0893e5b26416f9afa5063bd28ad4003e7de9578f7ad574e202c6f1bc5cb1e1433a8282c185ade2'
            'e744197e9e025386ad76a5b05564f1c0c0626da7f2febe19cceae8bbcfcc483e913c55ba13729f36a7f1a947d5c357e56b6b6a9ba895b94b6baff0833f7a3ace')

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/share/fonts/"{'O','T'}'TF'
	install -Dm644 'OTF/'*'.otf' "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 'TTF/'*'.ttf' "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/OFL-1.1-RFN"
}
