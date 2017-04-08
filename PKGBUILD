# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-urbanterror
pkgver=4.3.2
pkgrel=1
pkgdesc="Urban Terror is a team-based tactical shooter based on the Quake 3 Engine (Quake3 Mod Version)"
url="http://www.urbanterror.info/"
license=('custom')
arch=('any')
depends=('quake3')
source=('http://cdn.urbanterror.info/urt/43/releases/zips/UrbanTerror432_full.zip')
sha256sums=('74dee1566fa6cd0eb26d866149a1b6ad7e8f18a653693f02790c05ef7ce352a4')
PKGEXT='.pkg.tar'

package() {
    # Create Destination Directory
    install -d "${pkgdir}/opt/quake3/"

    # Base UT Files
    mv "${srcdir}/UrbanTerror43/q3ut4" "${pkgdir}/opt/quake3/"

    # Install License/Readme File
    install -D -m644 "${pkgdir}/opt/quake3/q3ut4/readme43.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/readme43.txt"
}
