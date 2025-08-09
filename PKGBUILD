# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=ttf-google-sans-code-nf
pkgver=1.0.0
pkgrel=1
pkgdesc="Google Sans Code NF - A feature-complete programming font based on Google Sans Code, enhanced with programming ligatures and Nerd Font icon support."
arch=('any')
url="https://github.com/wylu1037/google-sans-code-nerd-font"
license=('MIT')
depends=('fontconfig')
source=(
	"GoogleSansCodeNF-v${pkgver}.zip::https://github.com/wylu1037/google-sans-code-nerd-font/releases/download/v${pkgver}/google-sans-code-nerd-font.zip"
	"LICENSE.txt::https://raw.githubusercontent.com/wylu1037/google-sans-code-nerd-font/refs/heads/main/LICENSE"
)
sha256sums=('8281ed85d4104b4487acd5aa7ff501a89a83e8f699922d4ae95eee4743d9a1f5'
            'e33cad67c7fb109279ac79bcf60aa74fcba10df97cf56939c4fa8cbb3ae63520')

package() {
  # Install variable fonts
  install -Dm644 ./*.ttf -t "$pkgdir/usr/share/fonts/TTF/GoogleSansCodeNF/"
  
  # Install license
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
