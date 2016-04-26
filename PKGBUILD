# Maintainer: Markus Tacker <m@cto.hiv>
# Contributor: Peter Hoeg <peter@hoeg.com>

_pkgver_major=2
_pkgver_minor=020
pkgname=otf-hack
pkgver=${_pkgver_major}.${_pkgver_minor}
pkgrel=1
pkgdesc="Source Foundry Hack is is hand groomed and optically balanced typeface to be your go-to code face based on the Bitstream Vera Mono font."
arch=('any')
license=('SIL Open Font License 1.1 and Bitstream Vera License')
url="http://sourcefoundry.org/hack/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("https://github.com/chrissimpkins/Hack/releases/download/v${pkgver}/Hack-v${_pkgver_major}_${_pkgver_minor}-otf.tar.xz")
sha256sums=('d35c178915e7a474e0cd69333353db4be9758bf38d61474caa8922e8e5d3ce32')

package() {
  install -Dm644 -t $pkgdir/usr/share/fonts/OTF $srcdir/Hack-*.otf
}
