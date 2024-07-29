# Maintainer: Martin Larralde <martin.larralde@ens-paris-saclay.fr>

pkgname=imagej-plugin-morpholibj
pkgver=1.6.3
pkgrel=1
pkgdesc="Collection of mathematical morphology methods and plugins for ImageJ"
url="https://imagej.net/MorphoLibJ"
arch=("any")
license=("LGPL3")
groups=()
makedepends=()
depends=('imagej')
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
    install -m755 -d ${pkgdir}/usr/share/imagej/plugins/jars
    install -m644  ${srcdir}/MorphoLibJ_-${pkgver}.jar ${pkgdir}/usr/share/imagej/plugins/jars/
}

