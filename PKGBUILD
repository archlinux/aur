# Maintainer: avionix <avionix at gmx dot com>

pkgname=ttf-astacid-mono
_commit='fca83c318d8f385b9d5694595128d85a72706a75'
pkgver='2.1'
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
	'6b4dd832649ac1174c374eee74c7bdd634d2fb09e92b668d8bd4be77b5942206'
	'e90426c375b877d77a36ef79b07ec6db3899bd11143c757d53a2bc16a5b649db'
	'346d6efd6ae4a777f10845425ab1c4fa11d89424cbea43b186e82058f8e11d5b'
	'767dc5dc909224ef1c8d91f589f22098393fa0f24b30516eb309eedfb5769079'
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

