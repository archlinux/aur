# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Ainola

# Notes:
#   + gog:// DLAGENT:
#       - A gog:// DLAGENT can be configured in /etc/makepkg.conf to
#         automatically pull game files from GOG.
#       - https://github.com/Sude-/lgogdownloader

pkgname='gog-dont-starve-rog'
pkgver=2.0.0.3
pkgrel=1
pkgdesc="Don't Starve: Reign of Giants DLC"
url="https://www.kleientertainment.com/games/dont-starve"
license=('custom')
arch=('i686' 'x86_64')
depends=('gog-dont-starve')
source=(
    "file://gog_don_t_starve_reign_of_giants_dlc_${pkgver}.sh"
)
sha256sums=(
    '814ef06c04d372077480dfea4d132d1613297f4f01722a9a324a4aee7af6cd22'
)

package(){
    cd "${srcdir}"

    install -d "${pkgdir}/opt/gog-dont-starve/"
    cp -r "data/noarch/game/" "${pkgdir}/opt/gog-dont-starve/"
}
