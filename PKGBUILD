# Maintainer: avionix <avionix at gmx dot com>

pkgname=ttf-astacid-mono
_commit='4c999ce4fc31b1f0ce60306a43db8cde065c309a'
pkgver='2.0'
pkgrel=1
pkgdesc='A DejaVu Sans Mono-based font for programming, patched with Nerd Fonts'
arch=('any')
url='https://github.com/avionix-g/astacid'
license=('custom:MIT')
source=(
	"AstacidMono-Bold-${pkgver}.ttf::${url}/raw/${_commit}/dist/AstacidMono-Bold.ttf"
	"AstacidMono-BoldOblique-${pkgver}.ttf::${url}/raw/${_commit}/dist/AstacidMono-BoldOblique.ttf"
	"AstacidMono-Oblique-${pkgver}.ttf::${url}/raw/${_commit}/dist/AstacidMono-Oblique.ttf"
	"AstacidMono-Regular-${pkgver}.ttf::${url}/raw/${_commit}/dist/AstacidMono-Regular.ttf"
	"${pkgname}-${pkgver}-MIT.txt::${url}/raw/${_commit}/LICENSE"
)
sha256sums=(
	'e60f569c21c46bd66ba425a3daf2902997db559dbaf484361d2d7a2db31b47b6'
	'7d8e5614caf057d82add7c0d07ec04e8a34e93676118ed6d1d35129d2a0bf9f1'
	'df7d4db56513d5890891f2e15bde59324125f2c96e1fe4a68fd1dfa0aa756e8f'
	'669b8fd4afb9494469bddcc582affece8751d5601df189d5a38999427fc9fa8b'
	'f4f617a9242f6faa4be05e3df0378cc3d7e9c49f73217b15cc4af7956646657c'
)

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 AstacidMono-Bold-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/AstacidMono-Bold.ttf"
  install -m 644 AstacidMono-BoldOblique-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/AstacidMono-BoldOblique.ttf"
  install -m 644 AstacidMono-Oblique-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/AstacidMono-Oblique.ttf"
  install -m 644 AstacidMono-Regular-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/AstacidMono-Regular.ttf"
  install -Dm 644 ${pkgname}-${pkgver}-MIT.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

