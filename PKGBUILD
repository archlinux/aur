# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=catacomb-snatch
pkgver=1.1.0
pkgrel=297
pkgdesc="Catacomb Snatch is a real-time strategy shoot'em up with a steampunk ancient Egypt theme"
arch=(any)
url="http://catacombsnatch.net/"
license=('custom')
depends=('java-runtime' 'xorg-server-utils' 'openal')
source=(catacomb-snatch.jar::http://ci.catacombsnatch.net/job/Catacomb-Snatch/${pkgrel}/artifact/build/libs/Catacomb-Snatch-${pkgver}-BETA.jar
        catacomb-snatch.png::https://raw.github.com/Maescool/Catacomb-Snatch/develop/res/art/icon/icon64.png
        catacomb-snatch.desktop
        catacomb-snatch
        LICENSE::https://raw.github.com/Maescool/Catacomb-Snatch/develop/LICENSE)
md5sums=('ecf29c4d44a8593b543170d21dd6ef56'
         'a1654d780d1a5d838b30cffc41b48450'
         '040847ddc7698129b98d302075adc8f9'
         '9c26092103b98564f9127936faf72fdb'
         '2abf3da47075351544e764f3b4c89317')

package() {
    install -D -m644 catacomb-snatch.png ${pkgdir}/usr/share/icons/catacomb-snatch.png
    install -D -m644 catacomb-snatch.jar ${pkgdir}/usr/bin/catacomb-snatch.jar
    install -D -m644 catacomb-snatch.desktop ${pkgdir}/usr/share/applications/catacomb-snatch.desktop
    install -D -m755 catacomb-snatch ${pkgdir}/usr/bin/catacomb-snatch    
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
