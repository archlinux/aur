# Contributor: Martin Florén <martin.floren@gmail.com>

pkgname=otf-junction
pkgver=1
pkgrel=2
pkgdesc="A humanist sans-serif typeface"
arch=('any')
url="http://theleagueofmoveabletype.com/junction/"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')

install=otf.install
source=('http://theleagueofmoveabletype.com/junction/download')

build() {
    cd $startdir/src
    install -Dm 644 "theleagueof-junction-18de841/Junction.otf" $pkgdir/usr/share/fonts/OTF/junction.otf
}
md5sums=('0f3dc688bf23dc5cafc325d9e9ef8273')
