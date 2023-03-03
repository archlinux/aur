# Maintainer: sunplan
pkgname=ttf-nanum-yethangul
# version number is not given
pkgver=0
pkgrel=1
pkgdesc='나눔옛한글 Nanum YetHangul'
arch=('any')
url='https://hangeul.naver.com/2014/archaicword'
license=('unknown')
source=(
	'http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_TTF_BARUNGOTHIC_YETHANGUL.zip'
	'http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_TTF_MYEONJO_YETHANGUL.zip'
)
sha256sums=('c821d6b48f5ffe34ef9d85e52dcdd056fa390c8a84eb16284adbdf59f7ef34ab'
            '9e569f06dd0b51033fe0ff8fc2d5fce0c7afee33aebcc461666e6542298397b1')

package() {
	install -Dm644 *".ttf" -t "$pkgdir/usr/share/fonts/TTF/"
}
