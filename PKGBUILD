# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Hexchain Tong <i@hexchain.org>

pkgname=ttf-opensans
pkgver=1.10
pkgrel=1
pkgdesc='Open Sans is a humanist sans serif typeface designed by Steve Matteson, Type Director of Ascender Corp.'
arch=('any')
url='http://en.wikipedia.org/wiki/Open_Sans'
license=('Apache')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install='ttf-opensans.install'
source=("http://pkgbuild.com/~alucryd/ttf-opensans-${pkgver}.zip")
sha256sums=('f14979b4a358311e51da601a2debb7f21a639912fa06d88825056c41d792871e')

package() {
  install -dm 755 "${pkgdir}"/usr/share/fonts/TTF
  install -m 644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/
}

# vim: ts=2 sw=2 et:
