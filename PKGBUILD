# Maintainer: Shen ZhongLi <szl921818@gmail.com>
pkgname=mindmaster
pkgver=7.2
pkgrel=3
arch=('x86_64')
conflicts=("mindmaster-cn")
options=(!strip)
pkgdesc="Draw mind maps and brainstorming diagrams in an automatic way"
license=('Commercial')
#depends=('fcitx-qt5')
url="https://www.edrawsoft.com/mindmaster/"
source_x86_64=("https://www.edrawsoft.com/archives/mindmaster-7-amd64.deb")
sha256sums_x86_64=('47a9ea929f5666eb439cf0cf2ff4f40e736afc1312b5d42440e3fe2a0d961adc')



package() {	
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.xz"
    
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/icons
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes
    mkdir -p ${pkgdir}/usr/share/mime/packages
    
    ln -f -s /opt/MindMaster-7/MindMaster "${pkgdir}/usr/bin/mindmaster"
    
    ln -f -s /opt/MindMaster-7/mindmaster.png "${pkgdir}/usr/share/icons/mindmaster.png"
    
    ln -f -s /opt/MindMaster-7/emmx.svg "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/emmx.svg"
    
    ln -f -s /opt/MindMaster-7/mindmaster.xml "${pkgdir}/usr/share/mime/packages/mindmaster.xml"
    
#    cp /usr/lib/qt/plugins/platforminputcontexts/libfcitxplatforminputcontextplugin.so "${pkgdir}/opt/MindMaster-7/plugins/platforminputcontexts/"
}







