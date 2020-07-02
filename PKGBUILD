# Maintainer: Allen Choong <allencch at hotmail dot com>

pkgname=ttf-ancient-semitic
pkgver=0.06
pkgrel=3
pkgdesc="Ancient Semitic fonts including Samaritan"
arch=('any')
url="http://culmus.sourceforge.net"
license=('GPL2')
depends=('fontconfig' 'xorg-fonts-alias-100dpi' 'xorg-fonts-alias-75dpi' 'xorg-font-utils' 'xorg-fonts-encodings')
install=${pkgname}.install
source=(
  "http://downloads.sourceforge.net/culmus/AncientSemiticFonts-${pkgver}-1.TTF.tgz"
)
md5sums=('9b7a71347ba069e0d0d529650b8434e7')

package() {
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/AncientSemiticFonts-${pkgver}-1.TTF/fonts/*.ttf $pkgdir/usr/share/fonts/TTF
}

