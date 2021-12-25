# Maintainer: Klaus Ferreira <klauseverwalkingdev at yandex dot com>

pkgname="ttf-squadaone"
pkgver=20211224
pkgrel=1
pkgdesc="A bold presence and geometric, condensed typeface. It can be used at any size while still maintaining clarity and smoothness."
arch=('any')
license=('custom:SIL Open Font License')
url="https://fonts.google.com/specimen/Squada+One"
_gitver='633ebadbf5280a439a49ee831ab9446093b27f62'
source=("https://github.com/google/fonts/raw/${_gitver}/ofl/squadaone/SquadaOne-Regular.ttf"
	"https://github.com/google/fonts/raw/${_gitver}/ofl/squadaone/OFL.txt")
sha256sums=('dbbc06a0735155910c05d5f65878cab3dca009a3c43b7bb837c6385c09c83eec'
            '8c409bf0d41e4cee2d8256595c09cd1f760507a76d6a4431ca8a2815bb091618')
	
package() {
	install -Dm644 "SquadaOne-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/SquadaOne-Regular.ttf"
	install -Dm644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	}

