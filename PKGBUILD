# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=open-delta
pkgver=1.02
pkgrel=1
pkgdesc="DEscription Language of TAxonomy"
arch=('x86_64')
url="https://github.com/AtlasOfLivingAustralia/open-delta"
license=('unknown')
source=("https://github.com/AtlasOfLivingAustralia/open-delta/files/4686516/open-delta-1.02-bin.zip" "delta.desktop" "delta.gif")
sha256sums=('f3e2cd3d6abb572e2e856e624a574b100592da40c7c6639a9dd28abcc5e5c993'
            'e075ba953ae1c5de3ba3f38586980a989d70519f31576806cdda2f4826ab5af2'
            '583b2666eb51f488aefe27caf870961478fcdd9272304d667d83631fe62e8e0f')
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
    mkdir "${pkgdir}/usr/share/delta"
    mkdir "${pkgdir}/usr/share/delta/lib"
    
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/bsaf-1.9.jar ${pkgdir}/usr/share/delta/lib/bsaf-1.9.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/commons-beanutils-1.8.3.jar ${pkgdir}/usr/share/delta/lib/commons-beanutils-1.8.3.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/commons-cli-1.2.jar ${pkgdir}/usr/share/delta/lib/commons-cli-1.2.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/commons-codec-1.7.jar ${pkgdir}/usr/share/delta/lib/commons-codec-1.7.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/commons-collections-3.2.jar ${pkgdir}/usr/share/delta/lib/commons-collections-3.2.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/commons-io-2.0.1.jar ${pkgdir}/usr/share/delta/lib/commons-io-2.0.1.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/commons-lang-2.6.jar ${pkgdir}/usr/share/delta/lib/commons-lang-2.6.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/commons-logging-1.1.1.jar ${pkgdir}/usr/share/delta/lib/commons-logging-1.1.1.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/confor-1.02.jar ${pkgdir}/usr/share/delta/lib/confor-1.02.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/delta-common-1.02.jar ${pkgdir}/usr/share/delta/lib/delta-common-1.02.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/delta-editor-1.02.jar ${pkgdir}/usr/share/delta/lib/delta-editor-1.02.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/delta-intkey-1.02.jar ${pkgdir}/usr/share/delta/lib/delta-intkey-1.02.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/delta-ui-common-1.02.jar ${pkgdir}/usr/share/delta/lib/delta-ui-common-1.02.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/dist-1.02.jar ${pkgdir}/usr/share/delta/lib/dist-1.02.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/ezmorph-1.0.6.jar ${pkgdir}/usr/share/delta/lib/ezmorph-1.0.6.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/javahelp-2.0.05.jar ${pkgdir}/usr/share/delta/lib/javahelp-2.0.05.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/json-lib-2.2.3.jar ${pkgdir}/usr/share/delta/lib/json-lib-2.2.3.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/key-1.02.jar ${pkgdir}/usr/share/delta/lib/key-1.02.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/l2fprod-common-fontchooser-6.9.1.jar ${pkgdir}/usr/share/delta/lib/l2fprod-common-fontchooser-6.9.1.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/l2fprod-common-shared-6.9.1.jar ${pkgdir}/usr/share/delta/lib/l2fprod-common-shared-6.9.1.jar
    install -m 755 ${srcdir}/open-delta-${pkgver}/lib/miglayout-3.7.4.jar ${pkgdir}/usr/share/delta/lib/miglayout-3.7.4.jar
    
    install -m 755 ${srcdir}/delta.gif  ${pkgdir}/usr/share/delta/delta.gif
    install -m 755 ${srcdir}/delta.desktop ${pkgdir}/usr/share/applications/delta.desktop
}
