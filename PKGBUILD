# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=jmodeltest
pkgver=2.1.10
pkgrel=1
pkgdesc="Phylogenetic Model Averaging, more models, new heuristics and high-performance computing"
arch=('x86_64')
url="https://github.com/ddarriba/jmodeltest2"
license=('GPL-3.0 License')
source=("https://github.com/ddarriba/jmodeltest2/files/157117/jmodeltest-2.1.10.tar.gz")
sha256sums=('SKIP')
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
package() {
    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/applications"
    mkdir "${pkgdir}/usr/share/jmodeltest"
    mkdir "${pkgdir}/usr/share/jmodeltest/lib"
    mkdir "${pkgdir}/usr/share/jmodeltest/exe"
    mkdir "${pkgdir}/usr/share/jmodeltest/exe/phyml"
    mkdir "${pkgdir}/usr/share/jmodeltest/conf"
    mkdir "${pkgdir}/usr/share/jmodeltest/extra"
    mkdir "${pkgdir}/usr/share/jmodeltest/resources"
    mkdir "${pkgdir}/usr/share/jmodeltest/resources/template"
    mkdir "${pkgdir}/usr/share/jmodeltest/resources/template/resources"
    mkdir "${pkgdir}/usr/share/jmodeltest/log"
    
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/jModelTest.jar ${pkgdir}/usr/share/jmodeltest/jModelTest.jar
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/CHANGELOG ${pkgdir}/usr/share/jmodeltest/CHANGELOG
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/COPYING ${pkgdir}/usr/share/jmodeltest/COPYING
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/README ${pkgdir}/usr/share/jmodeltest/README
    
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/lib/alter.jar ${pkgdir}/usr/share/jmodeltest/lib/alter.jar
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/lib/BrowserLauncher2-all-1_3.jar ${pkgdir}/usr/share/jmodeltest/lib/BrowserLauncher2-all-1_3.jar
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/lib/freemarker.jar ${pkgdir}/usr/share/jmodeltest/lib/freemarker.jar
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/lib/jcommon-1.0.17.jar ${pkgdir}/usr/share/jmodeltest/lib/jcommon-1.0.17.jar
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/lib/jfreechart-1.0.14.jar ${pkgdir}/usr/share/jmodeltest/lib/jfreechart-1.0.14.jar
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/lib/mpj.jar ${pkgdir}/usr/share/jmodeltest/lib/mpj.jar
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/lib/pal.jar ${pkgdir}/usr/share/jmodeltest/lib/pal.jar
    
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/conf/jmodeltest.conf ${pkgdir}/usr/share/jmodeltest/conf/jmodeltest.conf
    
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/exe/phyml/PhyML_3.0_linux32 ${pkgdir}/usr/share/jmodeltest/exe/phyml/PhyML_3.0_linux32
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/exe/phyml/PhyML_3.0_linux64 ${pkgdir}/usr/share/jmodeltest/exe/phyml/PhyML_3.0_linux64
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/exe/phyml/README ${pkgdir}/usr/share/jmodeltest/exe/phyml/README
    
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/extra/filecluster8.conf.template ${pkgdir}/usr/share/jmodeltest/extra/filecluster8.conf.template
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/extra/machines ${pkgdir}/usr/share/jmodeltest/extra/machines
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/extra/mpj.tar.gz ${pkgdir}/usr/share/jmodeltest/extra/mpj.tar.gz
    
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/resources/template/index.html ${pkgdir}/usr/share/jmodeltest/resources/template/index.html
    
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/resources/template/resources/homeIcon.gif ${pkgdir}/usr/share/jmodeltest/resources/template/resources/homeIcon.gif
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/resources/template/resources/logo0.png ${pkgdir}/usr/share/jmodeltest/resources/template/resources/logo0.png
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/resources/template/resources/style.css ${pkgdir}/usr/share/jmodeltest/resources/template/resources/style.css
    install -m 755 ${srcdir}/jmodeltest-${pkgver}/resources/template/resources/topIcon.gif ${pkgdir}/usr/share/jmodeltest/resources/template/resources/topIcon.gif
    
    cp ~/.cache/yay/jmodeltest/jmodeltest.desktop ${pkgdir}/usr/share/applications
}
