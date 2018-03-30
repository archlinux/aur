# Maintainer: JanV3 <jan.valiska@gmail.com>
pkgname=ttf-nerd-fonts-hack-complete-git
pkgver=20180330
pkgrel=1
pkgdesc="A typeface designed for source code. Patched with Nerd Fonts iconics."
arch=(any)
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
replaces=('ttf-nerd-fonts-knack-complete-git')
raw_url="$url/raw/master/patched-fonts/Hack"

# bold and bolditalic versions are temporarily disabled, because of empty ttf files on upstream
source=(
"Hack-Regular-Nerd-Font-Complete.ttf::$raw_url/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf"
"Hack-Regular-Nerd-Font-Complete-Mono.ttf::$raw_url/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
#"Hack-Bold-Nerd-Font-Complete.ttf::$raw_url/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf"
#"Hack-Bold-Nerd-Font-Complete-Mono.ttf::$raw_url/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf"
"Hack-Italic-Nerd-Font-Complete.ttf::$raw_url/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf"
"Hack-Italic-Nerd-Font-Complete-Mono.ttf::$raw_url/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
#"Hack-BoldItalic-Nerd-Font-Complete.ttf::$raw_url/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf"
#"Hack-BoldItalic-Nerd-Font-Complete-Mono.ttf::$raw_url/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
)
#md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  date +%Y%m%d
}

package() {
  install -dm0755 ${pkgdir}/usr/share/fonts/TTF
  install -Dm0644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
}
