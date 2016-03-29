pkgname=dosbox-eden
pkgver=1.0
pkgrel=1
pkgdesc="Eden Blues - old DOS game"
arch=("any")
url="http://www.old-games.com/"
license=('freeware')
depends=('dosbox' 'sdl' 'unzip')

source=(
    'http://ds.old-games.com/0d13d819f0/files.the-underdogs.info/edenblues.zip'
    'dosbox-eden.png'
    'dosbox-eden.desktop'
    'dosbox-eden.conf'
)

md5sums=('30d068687a55f69b119f047fa476c11a'
         '02e88ae05eb4b10977d84e4ada491c68'
         '6754c5f7584fbd08d5a8e11a32b78bff'
         '449aa5d3dfabaeb9f888bc22d62dbdd6')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/dosbox-eden
    install -D -m644 dosbox-eden.conf ${pkgdir}/usr/local/games/dosbox-eden/dosbox-eden.conf
    install -D -m644 dosbox-eden.png ${pkgdir}/usr/share/pixmaps/dosbox-eden.png
    install -D -m644 dosbox-eden.desktop ${pkgdir}/usr/share/applications/dosbox-eden.desktop
    install -D -m644 EDEN.EXE ${pkgdir}/usr/local/games/dosbox-eden/EDEN.EXE
}