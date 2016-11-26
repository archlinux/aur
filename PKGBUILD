# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-urbanterror
pkgver=4.3.1
pkgrel=1
pkgdesc="Urban Terror is a team-based tactical shooter based on the Quake 3 Engine (Quake3 Mod Version)"
url="http://www.urbanterror.info/"
license=('custom')
arch=('any')
depends=('quake3')
source=('http://cdn.fs1.urbanterror.info/urt/43/releases/zips/UrbanTerror431_full.zip')
sha256sums=('9c19556ad462e45bfd97e6c8cc1fa04206719c13f7480e6fef4eb8fcc4f2d6b5')
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
