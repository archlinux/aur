# Maintainer: Martin Larralde <martin.larralde@ens-paris-saclay.fr>

pkgname=imagej-plugin-morpholibj
pkgver=1.5.1
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
#source=("https://github.com/ijpb/MorphoLibJ/releases/download/v${pkgver}/MorphoLibJ_-${pkgver}.jar")
source=("https://github.com/ijpb/MorphoLibJ/releases/download/v1.5.1-FillLabelHoles-V2/MorphoLibJ_-1.5.1-FillLabelHolesV2.jar")
noextract=()
sha256sums=('d43c2adab13bf1fd2b71430387c478bb17f84e8b8b90c66bd54c45a3ee1e0985')

package() {
    install -m755 -d ${pkgdir}/usr/share/imagej/plugins/jars
    install -m644  ${srcdir}/MorphoLibJ_-${pkgver}.jar ${pkgdir}/usr/share/imagej/plugins/jars/
}

