# Maintainer: Jordan Klassen <forivall@gmail.com>
# Maintainer: Zach Jacobson <jacobsonzacharym@gmail.com>

pkgname=ttf-noto-emoji-monochrome
pkgrel=2
_commit='d5db91a19628f57c31332bb7e6f9ae3465678b4f'
pkgver=1.0.0
pkgdesc='Google Noto Emoji Monochrome font'
arch=(any)
url='https://fonts.google.com/noto/specimen/Noto+Emoji'
license=('OFL')
source=("NotoEmoji-Bold-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-Bold.ttf"
	"NotoEmoji-Light-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-Light.ttf"
	"NotoEmoji-Medium-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-Medium.ttf"
	"NotoEmoji-Regular-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-Regular.ttf"
	"NotoEmoji-SemiBold-${pkgver}.ttf::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/fonts/NotoEmoji-SemiBold.ttf"
	"${pkgname}-${pkgver}-OFL.txt::https://github.com/zjaco13/Noto-Emoji-Monochrome/raw/${_commit}/OFL.txt")
sha256sums=('11b9d9b7c8782dc974c89a0e2a65e51759df70fe6166fee7e1c110d74c8191c8'
	'07c5c1a58c9c398063ae18e59f28b3e3662e908a0e8c64dddcd377118d343624'
	'fcee5bd83cccf20f7b3407498080bf46c43b1393fb5122aaed35f20ee504dd64'
	'65fc21f6ad86acbe43c29f89ffc0dd77621709a517a50edd1370aa80230cc8fb'
	'beb8c1f06961cd601eea31bf4aba72f11e37d558af36d59b09ae548780139e65'
	'7f18ec1ebb6b50e3ed0f74b2c61f25b8d7cd69e43f4de66e991bcfd3c419a8bb')

package() {
	install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 NotoEmoji-Medium-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-Medium.ttf"
	install -m 644 NotoEmoji-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-Bold.ttf"
	install -m 644 NotoEmoji-SemiBold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-SemiBold.ttf"
	install -m 644 NotoEmoji-Light-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-Light.ttf"
	install -m 644 NotoEmoji-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/NotoEmoji-Regular.ttf"
	install -Dm644 ${pkgname}-${pkgver}-OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
