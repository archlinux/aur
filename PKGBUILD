# Maintainer: Martin Larralde <martin.larralde@embl.de>

pkgname=imagej-plugin-morpholibj
pkgver=1.6.5
pkgrel=1
pkgdesc="Collection of mathematical morphology methods and plugins for ImageJ"
url="https://imagej.net/MorphoLibJ"
arch=("any")
license=("LGPL3")
depends=('imagej')
source=("https://github.com/ijpb/MorphoLibJ/releases/download/MorphoLibJ_-${pkgver}/MorphoLibJ_-${pkgver}.jar")
sha256sums=('086c4661ccdd8c2787a6433468955df7646589b16cbae5c97607c18d8fe2af59')
	
package() {
    install -m755 -d ${pkgdir}/usr/share/imagej/plugins/jars
    install -m644  ${srcdir}/MorphoLibJ_-${pkgver}.jar ${pkgdir}/usr/share/imagej/plugins/jars/
}

