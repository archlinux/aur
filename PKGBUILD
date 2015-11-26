pkgname=dosbox-digger
pkgver=1.0
pkgrel=1
pkgdesc="Digger - old DOS game"
arch=("any")
url="http://www.dosgamesarchive.com"
license=('freeware')
depends=('dosbox' 'sdl' 'unzip')

source=(
    'http://image.dosgamesarchive.com/games/digger.zip'
    'dosbox-digger.png'
    'dosbox-digger.desktop'
    'dosbox-digger.conf'
)

md5sums=('978cc19407d9a3f9fc26e09398c39705'
    'ff8cb0fc6a62e81787b1438cde0b9c11'
    'a09d02b49e4d12cabc6dd55d73c5afcf'
    '40adbcbaa696a35d837b18a4a97adc41')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/dosbox-digger
    install -D -m644 dosbox-digger.conf ${pkgdir}/usr/local/games/dosbox-digger/dosbox-digger.conf
    install -D -m644 dosbox-digger.png ${pkgdir}/usr/share/pixmaps/dosbox-digger.png
    install -D -m644 dosbox-digger.desktop ${pkgdir}/usr/share/applications/dosbox-digger.desktop
    install -D -m644 DIGGER.EXE ${pkgdir}/usr/local/games/dosbox-digger/DIGGER.EXE
}