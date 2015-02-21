# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-urbanterror
pkgver=4.2.023
pkgrel=1
pkgdesc="Urban Terror is a team-based tactical shooter based on the Quake 3 Engine (Quake3 Mod Version)"
url="http://www.urbanterror.info/"
license=('custom')
arch=('any')
depends=('quake3')
source=('http://up.barbatos.fr/urt/UrbanTerror42_full023.zip')
sha256sums=('e287e2a17432b81551f5c16e431d752484ce9be10508e756542f653757a29090')
PKGEXT='.pkg.tar'

package() {
    # Create Destination Directory
    install -d "${pkgdir}/opt/quake3/"

    # Base UT Files
    mv "${srcdir}/UrbanTerror42/q3ut4" "${pkgdir}/opt/quake3/"

    # Install License/Readme File
    install -D -m644 "${pkgdir}/opt/quake3/q3ut4/readme42.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/readme42.txt"
}
