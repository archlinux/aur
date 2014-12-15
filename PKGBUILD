# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=ttf-dugfont
pkgver=0.1
pkgrel=1
pkgdesc="Neverhood game font"
arch=('any')
url="http://neverhood.etomite.cz/download.htm"
license=('unknown')
depends=('fontconfig' 'xorg-fonts-encodings')
install=$pkgname.install
source=(http://neverhood.etomite.cz/files/dugfont.ttf.zip)
md5sums=('e04e6dbacb19125199be9c7ac9a71937')

package() {
  cd "${srcdir}"

  install -Dm644 dugfont.ttf "${pkgdir}"/usr/share/fonts/TTF/dugfont.ttf
}
