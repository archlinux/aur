# Maintainer: ajs124 < aur AT ajs124 DOT de >
# Contributor : Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: dale <dale@archlinux.org>
# Contributor: bender02 at gmx dot com

pkgname=fortune-mod-hitchhiker
pkgver=20050611
pkgrel=1
pkgdesc="This is a collection of quotes --- fortune cookies --- from Douglas Adams' famous Hitchhikers Guide to the Galaxy."
url="http://www.splitbrain.org/projects/fortunes/hg2g"
arch=('any')
license=('unknown')
depends=('fortune-mod')
source=(http://www.splitbrain.org/_media/projects/fortunes/fortune-hitchhiker.tgz)
sha512sums=('a4f4a99c33764e6d4ec823a57f9d2d40168ddf3cb9506e85fb0f6f10b11673abd76d02e9af8a95926ba758a28fbbe895a427b40c36bd31bc43252c4e6dd610b0')

package() {
  mkdir -p "${pkgdir}/usr/share/fortune"
  install -Dm 644 "${srcdir}/fortune-hitchhiker/hitchhiker"* "${pkgdir}/usr/share/fortune/"
}
