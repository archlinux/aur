# Maintainer: Martin Larralde <martin.larralde@embl.de>

pkgname=fiji-plugin-morpholibj
pkgver=1.6.4
pkgrel=0
pkgdesc="Collection of mathematical morphology methods and plugins for ImageJ (Fiji version)"
url="https://imagej.net/MorphoLibJ"
arch=("any")
license=("LGPL3")
depends=('fiji-bin')
source=("https://github.com/ijpb/MorphoLibJ/releases/download/MorphoLibJ_-${pkgver}/MorphoLibJ_-${pkgver}.jar")
noextract=()
sha256sums=('ef1e3e7fa5c907233d95d47c6a49c4269732418da99193695b299572ad6d370f')

package() {
    install -m755 -d ${pkgdir}/opt/fiji/plugins/
    install -m644  ${srcdir}/MorphoLibJ_-${pkgver}.jar ${pkgdir}/opt/fiji/plugins/
}

