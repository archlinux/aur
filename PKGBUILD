# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=beast
pkgver=1.10.4
pkgrel=1
pkgdesc="Bayesian Evolutionary Analysis Sampling Trees"
arch=('x86_64')
url="http://beast.community/"
license=('LGPL-2.1 License')
source=("https://github.com/beast-dev/beast-mcmc/releases/download/v${pkgver}/BEASTv${pkgver}.tgz" "beast_beast.desktop" "beauti_beast.desktop" "logcombiner_beast.desktop" "treeannotator_beast.desktop" "treestat_beast.desktop" "treestat.png")
sha256sums=('be652c4d55953f7c6c7a9d3eb3de203c77dc380e81ad81cfe0492408990c36a8'
            '4f3118c4ffc2added01200a42417cbdf0ca8549ab0b6fb5516b2eec2a2d77d14'
            '8baa97527cf3af1c6f2b4cbe2825da83117b315222fb0b685e82a4b61bcaac3e'
            'b420f1c78a2daf9b4a4d572a90228d83dcc9aba02690be8387c4e37d0f1ebe05'
            '2317783703a95a98fc91a0a6d392bec1569e71ac62750d48a867e17c58b79586'
            '32947f594b74e8aaf11813768dbf3be1eeec8153eb5d126da3800e8b34bc1396'
            'aca5c3f88ea8624d94b9e6e0e8f4b41a1f981562ad33bee2f35cc15de84f9906')
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
package() {
    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/bin"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/applications"
    mkdir "${pkgdir}/usr/share/beast"
    mkdir "${pkgdir}/usr/share/beast/bin"
    mkdir "${pkgdir}/usr/share/beast/images"
    mkdir "${pkgdir}/usr/share/beast/lib"
    mkdir "${pkgdir}/usr/share/beast/native"
    mkdir "${pkgdir}/usr/share/beast/doc"
    
    install -m 755 ${srcdir}/BEASTv${pkgver}/bin/beast ${pkgdir}/usr/share/beast/bin/beast
    install -m 755 ${srcdir}/BEASTv${pkgver}/bin/beauti ${pkgdir}/usr/share/beast/bin/beauti
    install -m 755 ${srcdir}/BEASTv${pkgver}/bin/loganalyser ${pkgdir}/usr/share/beast/bin/loganalyser
    install -m 755 ${srcdir}/BEASTv${pkgver}/bin/logcombiner ${pkgdir}/usr/share/beast/bin/logcombiner
    install -m 755 ${srcdir}/BEASTv${pkgver}/bin/treeannotator ${pkgdir}/usr/share/beast/bin/treeannotator
    install -m 755 ${srcdir}/BEASTv${pkgver}/bin/treestat ${pkgdir}/usr/share/beast/bin/treestat
    
    install -m 755 ${srcdir}/BEASTv${pkgver}/doc/README.txt ${pkgdir}/usr/share/beast/doc/README.txt

    install -m 755 ${srcdir}/BEASTv${pkgver}/lib/beast.jar ${pkgdir}/usr/share/beast/lib/beast.jar
    install -m 755 ${srcdir}/BEASTv${pkgver}/lib/beauti.jar ${pkgdir}/usr/share/beast/lib/beauti.jar

    install -m 755 ${srcdir}/BEASTv${pkgver}/images/beast.png ${pkgdir}/usr/share/beast/images/beast.png
    install -m 755 ${srcdir}/BEASTv${pkgver}/images/beauti.png ${pkgdir}/usr/share/beast/images/beauti.png
    install -m 755 ${srcdir}/BEASTv${pkgver}/images/utility.png ${pkgdir}/usr/share/beast/images/utility.png
    
    install -m 755 ${srcdir}/BEASTv${pkgver}/README.txt ${pkgdir}/usr/share/beast/README.txt
    install -m 755 "${srcdir}/BEASTv${pkgver}/VERSION HISTORY.txt" "${pkgdir}/usr/share/beast/VERSION HISTORY.txt"
    
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/AminoAcidLikelihoodCore.c ${pkgdir}/usr/share/beast/native/AminoAcidLikelihoodCore.c
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/AminoAcidLikelihoodCore.h ${pkgdir}/usr/share/beast/native/AminoAcidLikelihoodCore.h
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/compileNativeWin32.bat ${pkgdir}/usr/share/beast/native/compileNativeWin32.bat
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/GeneralLikelihoodCore.c ${pkgdir}/usr/share/beast/native/GeneralLikelihoodCore.c
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/GeneralLikelihoodCore.h ${pkgdir}/usr/share/beast/native/GeneralLikelihoodCore.h
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/Makefile.amd64 ${pkgdir}/usr/share/beast/native/Makefile.amd64
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/Makefile.ia64 ${pkgdir}/usr/share/beast/native/Makefile.ia64
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/Makefile.icc ${pkgdir}/usr/share/beast/native/Makefile.icc
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/Makefile.linux ${pkgdir}/usr/share/beast/native/Makefile.linux
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/NativeMemoryLikelihoodCore.c ${pkgdir}/usr/share/beast/native/NativeMemoryLikelihoodCore.c
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/NativeMemoryLikelihoodCore.h ${pkgdir}/usr/share/beast/native/NativeMemoryLikelihoodCore.h
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/NativeSubstitutionModel.c ${pkgdir}/usr/share/beast/native/NativeSubstitutionModel.c
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/NativeSubstitutionModel.h ${pkgdir}/usr/share/beast/native/NativeSubstitutionModel.h
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/NucleotideLikelihoodCore.c ${pkgdir}/usr/share/beast/native/NucleotideLikelihoodCore.c
    install -m 755 ${srcdir}/BEASTv${pkgver}/native/NucleotideLikelihoodCore.h ${pkgdir}/usr/share/beast/native/NucleotideLikelihoodCore.h    
    
    ln -s /usr/share/beast/bin/beauti ${pkgdir}/usr/bin/beauti_beast
    ln -s /usr/share/beast/bin/beast ${pkgdir}/usr/bin/beast_beast
    ln -s /usr/share/beast/bin/logcombiner ${pkgdir}/usr/bin/logcombiner_beast
    ln -s /usr/share/beast/bin/treeannotator ${pkgdir}/usr/bin/treeannotator_beast
    ln -s /usr/share/beast/bin/treestat ${pkgdir}/usr/bin/treestat_beast
    
    cp ~/.cache/yay/beast/treestat.png ${pkgdir}/usr/share/beast/images/
    
    cp ~/.cache/yay/beast/beauti_beast.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast/beast_beast.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast/treestat_beast.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast/logcombiner_beast.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast/treeannotator_beast.desktop ${pkgdir}/usr/share/applications
}
