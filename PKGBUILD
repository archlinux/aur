# Maintainer: Fabian Hinz <aur at naibafo dot de>

_pkgver_major=3
_pkgver_minor=0
_pkgver_patch=2
pkgname=otf-overpass
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_patch}
pkgrel=1
pkgdesc="An open source font family inspired by Highway Gothic. (sans-serif, OTF format)"
arch=('any')
license=('LGPL2.1')
url="http://overpassfont.org"
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("https://github.com/RedHatBrand/Overpass/releases/download/${pkgver}/overpass-desktop-fonts.zip")
sha256sums=('10d2186ad1e1e628122f2e4ea0bbde16438e34a0068c35190d41626d89bb64e4')

package() {
  install -d $pkgdir/usr/share/fonts/OTF
  install -Dm644 -t $pkgdir/usr/share/fonts/OTF $srcdir/overpass/overpass-*.otf
}
