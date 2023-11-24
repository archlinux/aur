# Maintainer: Fernando Carmona Varo <ferkiwi @t gmail dot com>
# Contributor: Evgeni Kunev <evgeni at kunev dot me>>
pkgname=otf-unscii-8
pkgver=2.1
pkgrel=1
pkgdesc="Unscii is a set of bitmapped Unicode fonts based on classic system fonts. Unscii attempts to support character cell art well while also being suitable for terminal and programming use."
url="http://viznut.fi/unscii/"
arch=('any')
license=('gpl')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://viznut.fi/unscii/unscii-8.otf")
sha512sums=('a0fa138bcce999fa647e1ef34ad6985e3c6e5a6a256f7a79628813de852e73c95a5808bc194b0ea5bb8d0e56288cf25f35a19a2f91898b963e8610805f988289')

package() {
  cd "${srcdir}"
  install -Dm644  "unscii-8.otf" "$pkgdir/usr/share/fonts/OTF/unscii-8.otf"
}

# vim:set ts=2 sw=2 et:
