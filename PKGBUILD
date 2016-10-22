# Contributor: Martin Florén <martin.floren@gmail.com>

pkgname=otf-junction
pkgver=1
pkgrel=3
pkgdesc="A humanist sans-serif typeface"
arch=('any')
url="http://theleagueofmoveabletype.com/junction/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=('http://theleagueofmoveabletype.com/junction/download')
md5sums=('f203674738bec183de8b10dc4beae333')

package() {
    cd $startdir/src
    install -Dm 644 "junction-master/Junction-regular.otf" $pkgdir/usr/share/fonts/OTF/junction.otf
    install -Dm 644 "junction-master/Junction-bold.otf" $pkgdir/usr/share/fonts/OTF/junction_bold.otf
    install -Dm 644 "junction-master/Junction-light.otf" $pkgdir/usr/share/fonts/OTF/junction_light.otf
}

