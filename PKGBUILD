# Maintainer: Martin Larralde <martin.larralde@ens-paris-saclay.fr>

pkgname=fiji-plugin-morpholibj
pkgver=1.6.3
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
source=("https://github.com/ijpb/MorphoLibJ/releases/download/MorphoLibJ_-${pkgver}/MorphoLibJ_-${pkgver}.jar")
noextract=()
sha256sums=('18feafc2b47b37ad71229aebc8bf31efe3f2aba93446cf8783e465213864f41d')

package() {
    install -m755 -d ${pkgdir}/opt/fiji/plugins/
    install -m644  ${srcdir}/MorphoLibJ_-${pkgver}.jar ${pkgdir}/opt/fiji/plugins/
}

