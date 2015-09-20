# Maintainer: Markus Tacker <m@cto.hiv>
# Contributor: Peter Hoeg <peter@hoeg.com>

_pkgver_major=2
_pkgver_minor=013
pkgname=ttf-hack
pkgver=${_pkgver_major}.${_pkgver_minor}
pkgrel=2
pkgdesc="Source Foundry Hack is is hand groomed and optically balanced typeface to be your go-to code face based on the Bitstream Vera Mono font."
arch=('any')
license=('SIL Open Font License 1.1 and Bitstream Vera License')
url="http://sourcefoundry.org/hack/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("https://github.com/chrissimpkins/Hack/releases/download/v${pkgver}/Hack-v${_pkgver_major}_${_pkgver_minor}-ttf.zip")
sha256sums=('d3da4704503380c2f92999ee2bcc2e2cd0b3bf7ee329078af5512d934eb88a9a')

package() {
  install -Dm644 -t $pkgdir/usr/share/fonts/TTF $srcdir/Hack-*.ttf
}
