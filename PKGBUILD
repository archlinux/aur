# Maintainer: Martin Larralde <martin.larralde@ens-paris-saclay.fr>

pkgname=imagej-plugin-morpholibj
pkgver=1.5.1
pkgrel=0
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
source=("https://github.com/ijpb/MorphoLibJ/releases/download/v${pkgver}/MorphoLibJ_-${pkgver}.jar")
noextract=()
sha256sums=('4e15c60ed1058ce5c103873c880e3d6448485d33359e6d37a63a208cdfb48a70')

package() {
    install -m755 -d ${pkgdir}/usr/share/imagej/plugins/jars
    install -m644  ${srcdir}/MorphoLibJ_-${pkgver}.jar ${pkgdir}/usr/share/imagej/plugins/jars/
}

