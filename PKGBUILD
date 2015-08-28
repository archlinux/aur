# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Maintainer: Drew Liszewski
pkgname=emulationstation-themes
pkgver=0.1
pkgrel=1
pkgdesc="EmulationStation themes pack"
arch=('any')
url="http://aloshi.com/emulationstation"
license=('WTFPL')
groups=()
makedepends=()
depends=()
install='emulationstation-themes.install'
source=("${pkgname}-${pkgver}.zip::http://www.aloshi.com/es_downloads/es_themes_jan_20_2013.zip")
md5sums=('d72d30690bce0f00ca6c276bbc5ff816')

package() {
    cd "${srcdir}"
    install -d ${pkgdir}/usr/share/EmulationStation/themes
    cp -r ${srcdir}/* ${pkgdir}/usr/share/EmulationStation/themes/
}
