# Maintainer: markzz <mark dot weiman at markzz dot com>
# Contributor: ShadowKyogre <shadowkyogre@aim.com>

pkgname=ttf-totem
pkgver=1.0
pkgrel=1
pkgdesc="Totem is a free font. Feel free to use it for personal and commercial."
arch=('any')
url="https://www.behance.net/gallery/16490287/TOTEM-Free-Typeface"
license=('custom')
#makedepends=('unzip')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
source=("https://www.dropbox.com/s/e02a0xkoqzjb2h8/TOTEM.zip")
md5sums=('2873718a9127ca5a5d8c83c37d15a7e0')
install=$pkgname.install

package() {
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -dm755 "$pkgdir/usr/share/licenses/${pkgname}"
  
  install -m644 "$srcdir/Totem.ttf" "$pkgdir/usr/share/fonts/TTF/Totem.ttf"
  install -m644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
