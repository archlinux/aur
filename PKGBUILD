# Maintainer: Martin Larralde <martin.larralde@ens-paris-saclay.fr>

pkgname=fiji-plugin-morpholibj
pkgver=1.4.2
pkgrel=0
pkgdesc="Collection of mathematical morphology methods and plugins for ImageJ (Fiji version)"
url="https://imagej.net/MorphoLibJ"
arch=("any")
license=("LGPL3")
groups=()
makedepends=()
depends=('fiji-bin')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/ijpb/MorphoLibJ/releases/download/v${pkgver}/MorphoLibJ_-${pkgver}.jar")
noextract=()
md5sums=('f936b01d3d4fa3bb8d705706c10c5c2f')

package() {
    install -m755 -d ${pkgdir}/opt/fiji/plugins/
    install -m644  ${srcdir}/MorphoLibJ_-${pkgver}.jar ${pkgdir}/opt/fiji/plugins/
}

