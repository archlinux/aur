# Maintainer: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-16-full
pkgver=2.1
pkgrel=1
pkgdesc="Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use. Full unicode support."
url="http://viznut.fi/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://viznut.fi/unscii/unscii-16-full.otf")
sha512sums=('f334f33d989a23d87fa80491d67286dd9eef4de7e85cc617b83d5eb62f19fb70a5b0b8158271913d664b5966bea4c8747707d6f116c663ff796d3ddf1e8bdf21')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-16-full.otf" "$pkgdir/usr/share/fonts/OTF/unscii-16-full.otf"
}

# vim:set ts=2 sw=2 et:
