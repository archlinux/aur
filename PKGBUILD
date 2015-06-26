# Maintainer: Archadept
#   Revision: 2015-06-26

pkgname=ttf-neverworld
_pkgname=neverworld
pkgver=1
pkgrel=2
pkgdesc="A basic decorative ttf font with fantasy symbols by Enoch based on Neale Davidson fonts"
arch=('any')
url="http://neverwintervault.org/project/nwn1/other/neverworld-font"
license=('Free for non commercial use')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://neverwintervault.org/sites/all/modules/pubdlcnt/pubdlcnt.php?file=http://neverwintervault.org/sites/neverwintervault.org/files/project/3383/files/neverworld.zip&nid=3383")
md5sums=('19483fa43bae55542027b75c987ec9d8')

package() {
    install -Dm644 "$_pkgname.ttf" "$pkgdir/usr/share/fonts/TTF/$_pkgname.ttf"
}
