# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-rocketarena
pkgver=1.80
pkgrel=1
pkgdesc="Rocket Arena is a modification for Quake 3 where players compete in multiple arenas tournament style."
url="https://web.archive.org/web/20030331121306/http://www.rocketarena.org/"
license=('custom')
arch=('any')
depends=('quake3')
source=('https://www.mirrorservice.org/sites/quakeunity.com/modifications/rocketarena3/ra3180.zip')
sha256sums=('95d590cb516b01355ef38ccf54427961c69b0a596b41a6137135451891533a29')

package() {
    # Create Destination Directories
    install -d "${pkgdir}/opt/quake3/"

    # Remove unneeded files
    rm "${srcdir}/arena/"{qagamex86.dll,ra3_server.bat,ra3_server.sh}

    # Install RA3 Files
    cp -r "${srcdir}/arena" \
        "${pkgdir}/opt/quake3/"
}
