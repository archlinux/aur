# Maintainer: Edgard Castro <castro@edgard.org>
# Contributor: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-heuristica
pkgver=1.0.2
pkgrel=2
pkgdesc='A serif latin & cyrillic font, derived from the "Adobe Utopia" font by Apanov'
arch=('any')
url='https://sourceforge.net/projects/heuristica/'
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('otf-heuristica-ib' 'ttf-heuristica-ibx')
source=("https://downloads.sourceforge.net/project/heuristica/heuristica-ttf-${pkgver}.tar.xz")
sha256sums=('08bf21e44941d195dceab637c3d8e22f4b5ce8490c83993cebd85d721b92553d')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
