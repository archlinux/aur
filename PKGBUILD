# Maintainer: Archadept
#   Revision: 2020-07-10

pkgname=otf-neverwinter
_pkgname=Neverwinter
pkgver=1
pkgrel=1
pkgdesc="A basic decorative otf font by Neale Davidson based on the logo of the popular Neverwinter Nights computer game from Bioware (and has since become the official font!)"
arch=('any')
url="http://www.pixelsagas.com/"
license=('Free')
depends=('fontconfig' 'xorg-font-util')
conflicts=('ttf-neverwinter')
install=otf.install
source=("http://dl.dafont.com/dl/?f=neverwinter")
md5sums=('9060c382cafd2f9ef384de9fde40b0b7')

package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/fonts/OTF/
    install -Dm644 ${_pkgname}*.otf "$pkgdir/usr/share/fonts/OTF/"
}
