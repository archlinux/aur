# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=ttf-karatdemo-normal
pkgver=2.0
pkgrel=1
pkgdesc="A free trial version of the normal-weight Karat font used in the Arch Linux logo."
arch=('i686' 'x86_64')
url="http://www.rubicon.ca/samp_pg3.htm"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings')
install=${pkgname}.install
source=(ftp://ftp.rubicon.ca/outgoing/KaratDemo_TT.zip)
md5sums=('02887e3a54b6ceea6534a9456e363d33')

package() {
  cd "$srcdir"
  _fontname="KaratDemo-Normal.ttf"
  install -D -m644 "$_fontname" "$pkgdir/usr/share/fonts/TTF/$_fontname"
  install -D -m644 Booklet.TXT "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
