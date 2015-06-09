# Contributor: Martin Florén <martin.floren@gmail.com>

pkgname=otf-raleway
pkgver=1
pkgrel=1
pkgdesc="A sans-serif typeface"
arch=('any')
url="http://theleagueofmoveabletype.com/raleway/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')

install=otf.install
source=('http://theleagueofmoveabletype.com/raleway/download')

build() {
    cd $startdir/src
    install -Dm 644 "theleagueof-raleway-40afd9d/Raleway Thin.otf" $pkgdir/usr/share/fonts/OTF/Raleway\ Thin.otf
}
md5sums=('ff280d51659a149751a3fe194d2944b4')
