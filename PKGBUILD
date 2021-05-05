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
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/BM"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/BM/BM"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/BM/FR"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/BM/M0"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/BSM"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/BSM/ModelA"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/BSM/ModelAnull"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/CM"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/CM/M22"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/CM/CmC"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/SM"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/SM/M0"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/SM/M1a"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/SM/M2a"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/SM/M3"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/SM/M7"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/SM/M8"
    mkdir "${pkgdir}/usr/share/EasyCodeML/Preset/SM/M8a"

    
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
    
    install -m 755 ${srcdir}/EasyCodeML/Preset/chi2.exe ${pkgdir}/usr/share/EasyCodeML/Preset/chi2.exe
    install -m 755 ${srcdir}/EasyCodeML/Preset/codeml.exe ${pkgdir}/usr/share/EasyCodeML/Preset/codeml.exe
    install -m 755 ${srcdir}/EasyCodeML/Preset/.DS_Store ${pkgdir}/usr/share/EasyCodeML/Preset/.DS_Store
    install -m 755 ${srcdir}/EasyCodeML/Preset/BM/.DS_Store ${pkgdir}/usr/share/EasyCodeML/Preset/BM/.DS_Store
    install -m 755 ${srcdir}/EasyCodeML/Preset/BM/BM/.DS_Store ${pkgdir}/usr/share/EasyCodeML/Preset/BM/BM/.DS_Store
    install -m 755 ${srcdir}/EasyCodeML/Preset/BM/BM/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/BM/BM/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/BM/FR/.DS_Store ${pkgdir}/usr/share/EasyCodeML/Preset/BM/FR	/.DS_Store
    install -m 755 ${srcdir}/EasyCodeML/Preset/BM/FR/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/BM/FR/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/BM/M0/.DS_Store ${pkgdir}/usr/share/EasyCodeML/Preset/BM/M0/.DS_Store
    install -m 755 ${srcdir}/EasyCodeML/Preset/BM/M0/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/BM/M0/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/BSM/.DS_Store ${pkgdir}/usr/share/EasyCodeML/Preset/BSM/.DS_Store
    install -m 755 ${srcdir}/EasyCodeML/Preset/BSM//ModelA/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/BSM/ModelA/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/BSM/ModelAnull/.DS_Store ${pkgdir}/usr/share/EasyCodeML/Preset/BSM/ModelAnull/.DS_Store
    install -m 755 ${srcdir}/EasyCodeML/Preset/BSM/ModelAnull/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/BSM/ModelAnull/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/CM/.DS_Store ${pkgdir}/usr/share/EasyCodeML/Preset/CM/.DS_Store
    install -m 755 ${srcdir}/EasyCodeML/Preset/CM/CmC/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/CM/CmC/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/CM/M22/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/CM/M22/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/SM/.DS_Store ${pkgdir}/usr/share/EasyCodeML/Preset/SM/.DS_Store
    install -m 755 ${srcdir}/EasyCodeML/Preset/SM/M0/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/SM/M0/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/SM/M1a/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/SM/M1a/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/SM/M2a/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/SM/M2a/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/SM/M3/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/SM/M3/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/SM/M7/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/SM/M7/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/SM/M8/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/SM/M8/codeml.ctl
    install -m 755 ${srcdir}/EasyCodeML/Preset/SM/M8/.DS_Store ${pkgdir}/usr/share/EasyCodeML/Preset/SM/M8/.DS_Store
    install -m 755 ${srcdir}/EasyCodeML/Preset/SM/M8a/codeml.ctl ${pkgdir}/usr/share/EasyCodeML/Preset/SM/M8a/codeml.ctl
    
    cp ~/.cache/yay/easycodeml/EasyCodeML.png ${pkgdir}/usr/share/EasyCodeML/EasyCodeML.png
    cp ~/.cache/yay/easycodeml/easycodeml.desktop ${pkgdir}/usr/share/applications
}
