# Maintainer: Edgard Castro <castro@edgard.org>
# Contributor: Tyler Swagar <buttpickle69@shaw.ca>

pkgname=ttf-liberastika
pkgver=1.1.5
pkgrel=2
pkgdesc='A fork of Liberation Sans font by Apanov'
arch=('any')
url='https://sourceforge.net/projects/lib-ka/'
license=('GPL2')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('ttf-liberastika-ib')
source=("https://downloads.sourceforge.net/project/lib-ka/liberastika-ttf-${pkgver}.tar.xz")
sha256sums=('b95add839826cfa4a44146dfcc5ebffc31773b5137eddb525a00a2a6deeab8db')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
