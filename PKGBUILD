# Maintainer: Jordan Klassen <forivall@gmail.com>
# Maintainer: Zach Jacobson <jacobsonzacharym@gmail.com>

pkgname=ttf-noto-emoji-monochrome
pkgrel=2
_commit='b80db438fe644bd25e0032661ab66fa72f2af0e2'
pkgver=1.1.0
pkgdesc='Google Noto Emoji Monochrome font'
arch=(any)
provides=(emoji-font)
url='https://fonts.google.com/noto/specimen/Noto+Emoji'
license=('OFL-1.1')
source=("NotoEmoji-Bold-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-Bold.ttf"
	"NotoEmoji-Light-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-Light.ttf"
	"NotoEmoji-Medium-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-Medium.ttf"
	"NotoEmoji-Regular-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-Regular.ttf"
	"NotoEmoji-SemiBold-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-SemiBold.ttf"
	"NotoEmoji-Variable-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-VariableFont_wght.ttf"
	"${pkgname}-${pkgver}-OFL.txt::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/OFL.txt")
sha256sums=('67ee9ce9b80b232a9666b227da712ef3681c4689a41825e63659e989f2e293f5'
            '5ac83635aa9067fc0573a04ce603c8c0697671d49d895e2855347c905f3fd09f'
            'c72040a28f6fe23d37c9e898cf6f5cf0d7747d7860f35f846737249006225e75'
            'b57ed895ae9d09ba7b4b19c343a75cf39aad57156c3450e339d9d11556d7edc1'
            '051073e9b3bb4d07d5bffd33c0268b17dc5d177664af2cca0d86d794351536a3'
            '2a9f7623ab96cd6e82f90257ccd1bd4fe66ea982a0acf70d0d7aa1166e2c0885'
            'ab2dcc4de7edccb08a7e453bb88dd21bd3035fd5e8c9a2e977368b0ba3992281')

package() {
	install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 NotoEmoji-Medium-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-Medium.ttf"
	install -m 644 NotoEmoji-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-Bold.ttf"
	install -m 644 NotoEmoji-SemiBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-SemiBold.ttf"
	install -m 644 NotoEmoji-Light-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-Light.ttf"
	install -m 644 NotoEmoji-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-Regular.ttf"
	install -m 644 NotoEmoji-Variable-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-Variable.ttf"
	install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
