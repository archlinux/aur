# Maintainer: Nick Fode <nickfode@posteo.de>

pkgname=nerd-fonts-noto-sans-regular-complete
pkgver=2.2.2
pkgrel=0
pkgdesc="Noto Sans Regular Nerd Font complete"
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
_raw_url="https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/patched-fonts"
license=('MIT')
depends=('fontconfig' 'xorg-mkfontdir' 'xorg-mkfontscale')
install="${pkgname}.install"
md5sums=('5af23d398d0d3d6fdfcbf4a8a6ca2ce3')
source=(
  "Noto-Sans-Regular-Nerd-Font-Complete.ttf::${_raw_url}/Noto/Sans/complete/Noto%20Sans%20Regular%20Nerd%20Font%20Complete.ttf"
)
package() {

  install -dm0755 ${pkgdir}/usr/share/fonts/TTF
  install -Dm0644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF

}

