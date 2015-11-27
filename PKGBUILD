pkgname=dosbox-monte
pkgver=1.0
pkgrel=1
pkgdesc="Montezuma's Revenge - old DOS game"
arch=("any")
url="http://www.old-games.com"
license=('freeware')
depends=('dosbox' 'sdl' 'unzip')

source=(
    'http://ds.old-games.com/c5864dff58/files.the-underdogs.info/monte.zip'
    'dosbox-monte.png'
    'dosbox-monte.desktop'
    'dosbox-monte.conf'
)

md5sums=('fbd8ae9de3a17eaf776ca6f1bdae15f7'
         '4b711420501221aede0cbcb744b5a853'
         '81bc02d93992292e3c2d5b2238335616'
         'efd54f78f98132e197021661e8ceddcd')

package () {
    cd ${srcdir}
    install -d -m755 ${pkgdir}/usr/local/games/dosbox-monte
    install -D -m644 dosbox-monte.conf ${pkgdir}/usr/local/games/dosbox-monte/dosbox-monte.conf
    install -D -m644 dosbox-monte.png ${pkgdir}/usr/share/pixmaps/dosbox-monte.png
    install -D -m644 dosbox-monte.desktop ${pkgdir}/usr/share/applications/dosbox-monte.desktop
    install -D -m644 monte/MONTAZUM.COM ${pkgdir}/usr/local/games/dosbox-monte/MONTAZUM.COM
}
