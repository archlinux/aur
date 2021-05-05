# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=morphoj
pkgver=1.07a
pkgrel=1
pkgdesc="MorphoJ is an integrated program package for doing geometric morphometrics"
arch=('x86_64')
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
url="https://morphometrics.uk/MorphoJ_page.html"
license=('Apache License version 2')
source=("https://github.com/starsareintherose/morphoj/releases/download/${pkgver}/MorphoJ.zip")
sha256sums=('SKIP')


package() {

    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/applications"
    mkdir "${pkgdir}/usr/share/MorphoJ"
    mkdir "${pkgdir}/usr/share/MorphoJ/extras"
    mkdir "${pkgdir}/usr/share/MorphoJ/legal"
    mkdir "${pkgdir}/usr/share/MorphoJ/lib"
    mkdir "${pkgdir}/usr/share/MorphoJ/resources"
    
    install -m 755 ${srcdir}/MorphoJ/MorphoJ.jar ${pkgdir}/usr/share/MorphoJ/MorphoJ.jar
    
    install -m 755 ${srcdir}/MorphoJ/extras/MorphoJ_icon_64.png ${pkgdir}/usr/share/MorphoJ/extras/MorphoJ_icon_64.png
    
    install -m 755 ${srcdir}/MorphoJ/legal/Apache_LICENSE-2.0.txt ${pkgdir}/usr/share/MorphoJ/legal/Apache_LICENSE-2.0.txt
    install -m 755 ${srcdir}/MorphoJ/legal/colt_copyright.txt ${pkgdir}/usr/share/MorphoJ/legal/colt_copyright.txt
    install -m 755 ${srcdir}/MorphoJ/legal/dom4j.LICENSE.txt ${pkgdir}/usr/share/MorphoJ/legal/dom4j.LICENSE.txt
    install -m 755 ${srcdir}/MorphoJ/legal/LGPL.txt ${pkgdir}/usr/share/MorphoJ/legal/LGPL.txt
    install -m 755 ${srcdir}/MorphoJ/legal/LICENSE_universalJavaApplicationStub.txt ${pkgdir}/usr/share/MorphoJ/legal/LICENSE_universalJavaApplicationStub.txt
    
    install -m 755 ${srcdir}/MorphoJ/lib/avalon-framework-api-4.3.1.jar ${pkgdir}/usr/share/MorphoJ/lib/avalon-framework-api-4.3.1.jar
    install -m 755 ${srcdir}/MorphoJ/lib/avalon-framework-impl-4.3.1.jar ${pkgdir}/usr/share/MorphoJ/lib/avalon-framework-impl-4.3.1.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-all-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-all-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-anim-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-anim-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-awt-util-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-awt-util-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-bridge-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-bridge-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-css-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-css-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-dom-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-dom-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-ext-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-ext-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-gvt-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-gvt-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-parser-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-parser-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-script-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-script-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-svg-dom-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-svg-dom-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-svggen-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-svggen-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-transcoder-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-transcoder-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-util-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-util-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/batik-xml-1.10.jar ${pkgdir}/usr/share/MorphoJ/lib/batik-xml-1.10.jar
    install -m 755 ${srcdir}/MorphoJ/lib/colt.jar ${pkgdir}/usr/share/MorphoJ/lib/colt.jar
    install -m 755 ${srcdir}/MorphoJ/lib/commons-logging-1.2.jar ${pkgdir}/usr/share/MorphoJ/lib/commons-logging-1.2.jar
    install -m 755 ${srcdir}/MorphoJ/lib/dom4j-2.1.1.jar ${pkgdir}/usr/share/MorphoJ/lib/dom4j-2.1.1.jar
    install -m 755 ${srcdir}/MorphoJ/lib/fop.jar ${pkgdir}/usr/share/MorphoJ/lib/fop.jar
    install -m 755 ${srcdir}/MorphoJ/lib/fop-transcoder-allinone-2.2.jar ${pkgdir}/usr/share/MorphoJ/lib/fop-transcoder-allinone-2.2.jar
    install -m 755 ${srcdir}/MorphoJ/lib/js.jar ${pkgdir}/usr/share/MorphoJ/lib/js.jar
    install -m 755 ${srcdir}/MorphoJ/lib/swing-layout-1.0.4.jar ${pkgdir}/usr/share/MorphoJ/lib/swing-layout-1.0.4.jar
    install -m 755 ${srcdir}/MorphoJ/lib/xml-apis-1.3.04.jar ${pkgdir}/usr/share/MorphoJ/lib/xml-apis-1.3.04.jar
    install -m 755 ${srcdir}/MorphoJ/lib/xml-apis-ext-1.3.04.jar ${pkgdir}/usr/share/MorphoJ/lib/xml-apis-ext-1.3.04.jar
    install -m 755 ${srcdir}/MorphoJ/lib/xmlgraphics-commons-2.2.jar ${pkgdir}/usr/share/MorphoJ/lib/xmlgraphics-commons-2.2.jar

    install -D -m 755 ${srcdir}/MorphoJ/resources/*.gif "${pkgdir}/usr/share/MorphoJ/resources/"
    install -D -m 755 ${srcdir}/MorphoJ/resources/*.GIF "${pkgdir}/usr/share/MorphoJ/resources/"
    
  mv ~/.cache/yay/morphoj/MorphoJ.desktop ${pkgdir}/usr/share/applications
}
