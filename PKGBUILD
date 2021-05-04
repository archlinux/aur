# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=easycodeml
pkgver=1.21
pkgrel=1
pkgdesc="A visual tool for analysis of selection using CodeML"
arch=('x86_64')
url="https://github.com/BioEasy/EasyCodeML"
license=('unknow')
source=("https://github.com/starsareintherose/easycodeml/releases/download/${pkgver}/EasyCodeML.zip")
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
    mkdir "${pkgdir}/usr/share/EasyCodeML"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Custom"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Custom/dat"
    mkdir "${pkgdir}/usr/share/EasyCodeML/CodeMLSrc"
    mkdir "${pkgdir}/usr/share/EasyCodeML/CodeMLSrc/Linux"

    
    install -m 755 ${srcdir}/EasyCodeML/EasyCodeML.jar ${pkgdir}/usr/share/EasyCodeML/EasyCodeML.jar
    install -m 755 ${srcdir}/EasyCodeML/Quick_Guide.pdf ${pkgdir}/usr/share/EasyCodeML/Quick_Guide.pdf
    install -m 755 ${srcdir}/EasyCodeML/README.md ${pkgdir}/usr/share/EasyCodeML/README.md
    install -m 755 "${srcdir}/EasyCodeML/Version History.txt" "${pkgdir}/usr/share/EasyCodeML/Version History.txt"
    install -m 755 ${srcdir}/EasyCodeML/Citation.ris ${pkgdir}/usr/share/EasyCodeML/Citation.ris
    
    install -m 755 ${srcdir}/EasyCodeML/CodeMLSrc/chi2.c ${pkgdir}/usr/share/EasyCodeML/CodeMLSrc/chi2.c
    install -m 755 ${srcdir}/EasyCodeML/CodeMLSrc/chi2.c ${pkgdir}/usr/share/EasyCodeML/CodeMLSrc/chi2.c
    install -m 755 "${srcdir}/EasyCodeML/CodeMLSrc/Compile Commands for Mac or Linux" "${pkgdir}/usr/share/EasyCodeML/CodeMLSrc/Compile Commands for Mac or Linux"
    install -m 755 ${srcdir}/EasyCodeML/CodeMLSrc/paml.h ${pkgdir}/usr/share/EasyCodeML/CodeMLSrc/paml.h
    install -m 755 ${srcdir}/EasyCodeML/CodeMLSrc/tools.c ${pkgdir}/usr/share/EasyCodeML/CodeMLSrc/tools.c
    install -m 755 ${srcdir}/EasyCodeML/CodeMLSrc/treespace.c ${pkgdir}/usr/share/EasyCodeML/CodeMLSrc/treespace.c
    install -m 755 ${srcdir}/EasyCodeML/CodeMLSrc/treesub.c ${pkgdir}/usr/share/EasyCodeML/CodeMLSrc/treesub.c
    install -m 755 ${srcdir}/EasyCodeML/CodeMLSrc/Linux/chi2.exe ${pkgdir}/usr/share/EasyCodeML/CodeMLSrc/Linux/chi2.exe
    install -m 755 ${srcdir}/EasyCodeML/CodeMLSrc/Linux/codeml.exe ${pkgdir}/usr/share/EasyCodeML/CodeMLSrc/Linux/codeml.exe
    
    install -m 755 ${srcdir}/EasyCodeML/Custom/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Custom/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Custom/default.ctl ${pkgdir}/usr/share/EasyCodeML/Custom/default.ctl
    
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/cpREV10.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/cpREV10.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/cpREV64.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/cpREV64.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/dayhoff.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/dayhoff.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/dayhoff-dcmut.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/dayhoff-dcmut.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/g1974a.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/g1974a.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/g1974c.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/g1974c.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/g1974p.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/g1974p.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/g1974v.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/g1974v.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/grantham.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/grantham.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/jones.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/jones.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/jones-dcmut.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/jones-dcmut.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/lg.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/lg.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/miyata.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/miyata.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/mtArt.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/mtArt.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/mtmam.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/mtmam.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/mtREV24.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/mtREV24.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/MtZoa.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/MtZoa.dat
    install -m 755 ${srcdir}/EasyCodeML/Custom/dat/wag.dat ${pkgdir}/usr/share/EasyCodeML/Custom/dat/wag.dat
    
    cp ~/.cache/yay/easycodeml/easycodeml.desktop ${pkgdir}/usr/share/applications
}
