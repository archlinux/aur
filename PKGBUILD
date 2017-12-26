# Maintainer: JanV3 <jan.valiska@gmail.com>
pkgname=ttf-nerd-fonts-knack-complete-git
pkgver=20171226
pkgrel=1
pkgdesc="A typeface designed for source code. Patched with Nerd Fonts iconics."
arch=(any)
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
raw_url="$url/raw/master/patched-fonts/Hack"

source=(
"Knack-Regular-Nerd-Font-Complete.ttf::$raw_url/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete.ttf"
"Knack-Regular-Nerd-Font-Complete-Mono.ttf::$raw_url/Regular/complete/Knack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
"Knack-Bold-Nerd-Font-Complete.ttf::$raw_url/Bold/complete/Knack%20Bold%20Nerd%20Font%20Complete.ttf"
"Knack-Bold-Nerd-Font-Complete-Mono.ttf::$raw_url/Bold/complete/Knack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf"
"Knack-Italic-Nerd-Font-Complete.ttf::$raw_url/Italic/complete/Knack%20Italic%20Nerd%20Font%20Complete.ttf"
"Knack-Italic-Nerd-Font-Complete-Mono.ttf::$raw_url/Italic/complete/Knack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
"Knack-BoldItalic-Nerd-Font-Complete.ttf::$raw_url/BoldItalic/complete/Knack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf"
"Knack-BoldItalic-Nerd-Font-Complete-Mono.ttf::$raw_url/BoldItalic/complete/Knack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
)
md5sums=('SKIP'	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  date +%Y%m%d
}

package() {
  install -dm0755 ${pkgdir}/usr/share/fonts/TTF
  install -Dm0644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
}
