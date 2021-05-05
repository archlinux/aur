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
  cd "${srcdir}"
  chmod +x download.php?get=MorphoJ-installer_Unix_Linux.jar
  java -jar download.php?get=MorphoJ-installer_Unix_Linux.jar

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

    install -m 755 "${srcdir}/MorphoJ/resources/AngularComp icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/AngularComp icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/Covariance matrix icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/Covariance matrix icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/CVA icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/CVA icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/DataSet icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/DataSet icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/DiscFunc icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/DiscFunc icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/EstSelection icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/EstSelection icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/GPinv icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/GPinv icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/MatrixCorr icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/MatrixCorr icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/MinMaxIcon.gif" "${pkgdir}/usr/share/MorphoJ/resources/MinMaxIcon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/ModularityTest icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/ModularityTest icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/MorphoJ_icon_24.gif" "${pkgdir}/usr/share/MorphoJ/resources/MorphoJ_icon_24.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/MorphoJ_icon_32.gif" "${pkgdir}/usr/share/MorphoJ/resources/MorphoJ_icon_32.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/Outline icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/Outline icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/PCA icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/PCA icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/PCoAForCovMats icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/PCoAForCovMats icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/Phylogeny icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/Phylogeny icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/PhylogenyTreeSet icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/PhylogenyTreeSet icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/PliableTemplate icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/PliableTemplate icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/PLS icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/PLS icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/ProcAnova icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/ProcAnova icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/Project icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/Project icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/Regression icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/Regression icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/ResidFromOtherRegr icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/ResidFromOtherRegr icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/ScoresFromOthePCA icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/ScoresFromOthePCA icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/SelResp icon.gif" "${pkgdir}/usr/share/MorphoJ/resources/SelResp icon.gif"
    install -m 755 "${srcdir}/MorphoJ/resources/Wireframes icon.GIF" "${pkgdir}/usr/share/MorphoJ/resources/Wireframes icon.GIF"
    install -m 755 "${srcdir}/MorphoJ/resources/" "${pkgdir}/usr/share/MorphoJ/resources/"
    install -m 755 "${srcdir}/MorphoJ/resources/" "${pkgdir}/usr/share/MorphoJ/resources/"
    install -m 755 "${srcdir}/MorphoJ/resources/" "${pkgdir}/usr/share/MorphoJ/resources/"
    
  mv ~/.cache/yay/morphoj/MorphoJ.desktop ${pkgdir}/usr/share/applications
}
