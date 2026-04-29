pkgname=moon-child-fe-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Moon Child FE (Friend Edition) is a modern source port of the 1997 Windows 95 classic, Moon Child. It's designed to be the definitive way to experience the game on modern hardware."
arch=('x86_64')
url='https://github.com/MorsGames/MoonChildFE'
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://github.com/MorsGames/MoonChildFE/releases/download/v1.0.5/MoonChildFE-LinuxX64.tar.gz")
sha256sums=(a1938fee8a2ab420d73fee85a393c21a752ae2ce5caa1c497039a89d1432f8d3)

package(){
    install -Dm755 "${srcdir}/MoonChildFE" "$pkgdir/usr/share/${pkgname}/MoonChildFE"
    install -Dm755 "${srcdir}/gamecontrollerdb.txt" "$pkgdir/usr/share/${pkgname}/gamecontrollerdb.txt"
    cp -rf "${srcdir}/data" "$pkgdir/usr/share/${pkgname}/data"

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}