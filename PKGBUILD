pkgname=dosbox-alleycat
pkgver=1.0
pkgrel=1
pkgdesc="Alleycat - old DOS game"
arch=("any")
url="http://www.dosgamesarchive.com"
license=('freeware')
depends=('dosbox' 'sdl' 'unzip')

source=(
    'http://image.dosgamesarchive.com/games/alleycat.zip'
    'dosbox-alleycat.png'
    'dosbox-alleycat.desktop'
    'dosbox-alleycat.conf'
)

md5sums=('1001b48416fdc4b93506ef6ee9d56ded'
         '00032baeec0fd1f339d3f27ac639c583'
         '6ea8e853c3763433a772617673dbdbb1'
         '7ccacdef589d468e7e6f042e229c1cfc')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/dosbox-alleycat
    install -D -m644 dosbox-alleycat.conf ${pkgdir}/usr/local/games/dosbox-alleycat/dosbox-alleycat.conf
    install -D -m644 dosbox-alleycat.png ${pkgdir}/usr/share/pixmaps/dosbox-alleycat.png
    install -D -m644 dosbox-alleycat.desktop ${pkgdir}/usr/share/applications/dosbox-alleycat.desktop
    install -D -m644 ALLEYCAT.EXE ${pkgdir}/usr/local/games/dosbox-alleycat/ALLEYCAT.EXE
}