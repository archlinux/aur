# Maintainer: Markus Tacker <m@cto.hiv>
# Contributor: Peter Hoeg <peter@hoeg.com>

_pkgver_major=2
_pkgver_minor=015
pkgname=otf-hack
pkgver=${_pkgver_major}.${_pkgver_minor}
pkgrel=1
pkgdesc="Source Foundry Hack is is hand groomed and optically balanced typeface to be your go-to code face based on the Bitstream Vera Mono font."
arch=('any')
license=('SIL Open Font License 1.1 and Bitstream Vera License')
url="http://sourcefoundry.org/hack/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=("https://github.com/chrissimpkins/Hack/releases/download/v${pkgver}/Hack-v${_pkgver_major}_${_pkgver_minor}-otf.zip")
sha256sums=('e274aa23efdac2465a7ea8748ff5094ab7bf83e2e00a5b89045ee4d4f86fd906')

package() {
  install -Dm644 -t $pkgdir/usr/share/fonts/OTF $srcdir/Hack-*.otf
}
